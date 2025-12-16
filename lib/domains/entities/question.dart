import 'package:econa_mobile_app/domains/entities/ekyc_level.dart';
import 'package:econa_mobile_app/domains/entities/login_status.dart';
import 'package:econa_mobile_app/domains/entities/profile.dart';
import 'package:econa_mobile_app/domains/entities/requiring_review_profile_photo.dart';
import 'package:econa_mobile_app/domains/entities/signed_image_urls.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/gender_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/question.pb.dart' as proto;
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/thumbnail_user.pb.dart';
import 'package:econa_mobile_app/presentations/components/econa_badge.dart';
import 'package:econa_mobile_app/presentations/shared/photos/photo_url_resolver.dart';
import 'package:econa_mobile_app/presentations/util/age.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';

/// 質問エンティティ（表示用）
@freezed
abstract class Question with _$Question {
  const factory Question({
    required String questionId,
    required String text,
    String? answer,
  }) = _Question;

  // const Question._();

  /// proto.Question から表示用エンティティへ変換
  /// 投稿済みでない場合は null を返す
  static Question? fromProto(proto.Question q) {
    if(!q.hasPostedQuestion()) {
      return null;
    }
    return Question(
      questionId: q.questionId,
      text: q.postedQuestion.moderatedQuestion,
      answer: q.postedQuestion.hasAnswer() && q.postedQuestion.answer.isNotEmpty
          ? q.postedQuestion.answer
          : null,
    );
  }
}

/// しつもんカード表示用の集約（Question + Profile + isFavorite）
/// ThumbnailUserは保持せず、必要項目のみProfileへ詰め替える
@freezed
abstract class AnsweredQuestion with _$AnsweredQuestion {
  const factory AnsweredQuestion({
    // 質問情報
    required Question question,
    // プロフィール情報
    required Profile profile,
  }) = _AnsweredQuestion;

  const AnsweredQuestion._();

  static AnsweredQuestion? fromProtos({
    required proto.Question question,
  }) {
    final q = Question.fromProto(question);
    if (q == null) return null;

    final user = question.postedQuestion.thumbnailUser;

    final urls = user.profile.requiringReviewProfilePhotos
        .where((p) => p.hasCurrentSignedImageUrls() &&
        p.currentSignedImageUrls.hasMediumThumbnailWebpUrl() &&
        p.currentSignedImageUrls.mediumThumbnailWebpUrl.isNotEmpty)
        .map((p) => p.currentSignedImageUrls.mediumThumbnailWebpUrl)
        .toList();

    final images = resolveImagesFromUrls(
      urls: urls,
      genderCode: user.profile.genderCode,
      kind: PhotoUrlKind.mediumThumbnailWebpUrl,
    );

    // 年齢算出
    int? age;
    final updatableProfile = user.profile.updatableProfile;
    if (updatableProfile.hasBirthday()) {
      age = calculateAge(updatableProfile.birthday);
    }

    final profilePhotos = user.profile.requiringReviewProfilePhotos
        .map(RequiringReviewProfilePhoto.fromProtobuf)
        .toList();
    final bestImageUrls = profilePhotos.getBestImageUrls();

    final profile = Profile(
      images: images,
      name: updatableProfile.requiringReviewNickname.currentNickname,
      age: age,
      location: updatableProfile.residenceRegion.name,
      userId: user.userId,
      isFavorite: user.isFavorite,
      certificateLevel: CertificateLevel.fromCertificateLevelCode(
        user.userStatus.certificateLevelCode,
      ),
      loginStatus: LoginStatus.fromUserActivityTag(user.userActivityTag),
      badgeType: BadgeType.fromNewbieTag(user.newbieTag),
      bestImageUrls: bestImageUrls,
    );

    return AnsweredQuestion(
      question: q,
      profile: profile,
    );
  }
}

@freezed
abstract class ReceivedQuestion with _$ReceivedQuestion {
  const factory ReceivedQuestion({
    required Question question,
  }) = _ReceivedQuestion;

  const ReceivedQuestion._();

  static ReceivedQuestion? fromProtos({
    required proto.Question question,
  }) {
    final q = Question.fromProto(question);
    if (q == null) return null;


    return ReceivedQuestion(
      question: q,
    );
  }
}

@freezed
abstract class QuestionUser with _$QuestionUser {
  const factory QuestionUser({
    /// ユーザーID
    required String id,
    /// ユーザー名
    required String name,
    /// 性別
    required GenderCode genderCode,
    /// 年齢
    required int? age,
    /// 市区町村
    required String city,
    /// プロフィール画像URLのリスト
    required List<String> images,
    /// ベスト画像のSignedImageUrlsエンティティ（サイズ指定でURLを取得可能）
    required SignedImageUrls? bestImageUrls,
    /// 最終ログインからの経過時間
    required LoginStatus loginStatus,
    /// 本人確認レベル
    @Default(CertificateLevel.unspecified) CertificateLevel certificateLevel,
    /// お気に入り状態
    @Default(false) bool isFavorite,
    /// いいね状態
    @Default(false) bool isLiked,
  }) = _QuestionUser;

  const QuestionUser._();

  /// APIレスポンスからエンティティを作成
  factory QuestionUser.fromResponse(ThumbnailUser user) {
    final name =
        user.profile.updatableProfile.requiringReviewNickname.currentNickname;
    final genderCode = user.profile.genderCode;
    final city = user.profile.updatableProfile.residenceRegion.name;
    final age = calculateAge(user.profile.updatableProfile.birthday);
    final images = <String>[];
    if (user.profile.requiringReviewProfilePhotos.isNotEmpty) {
      for (final p in user.profile.requiringReviewProfilePhotos) {
        if (p.hasCurrentSignedImageUrls()) {
          final url = p.currentSignedImageUrls.largeThumbnailWebpUrl;
          if (url.isNotEmpty) images.add(url);
        }
      }
    }

    // プロフィール写真のリストを作成
    final profilePhotos = user.profile.requiringReviewProfilePhotos
        .map(RequiringReviewProfilePhoto.fromProtobuf)
        .toList();

    // ベスト画像のSignedImageUrlsエンティティを取得
    final bestImageUrls = profilePhotos.getBestImageUrls();

    final loginStatus = LoginStatus.fromUserActivityTag(
      user.userActivityTag,
    );

    final certificateLevel = user.hasUserStatus()
        ? CertificateLevel.fromCertificateLevelCode(
      user.userStatus.certificateLevelCode,
    )
        : CertificateLevel.unspecified;

    return QuestionUser(
      id: user.userId,
      name: name,
      genderCode: genderCode,
      age: age,
      city: city,
      images: images,
      bestImageUrls: bestImageUrls,
      loginStatus: loginStatus,
      certificateLevel: certificateLevel,
      isFavorite: user.isFavorite,
      isLiked: user.hasLike(),
    );
  }
}

/// QuestionUserUserの拡張メソッド
extension QuestionUserExtension on QuestionUser {
  /// 男性かどうかを取得
  bool get isMale => genderCode == GenderCode.GENDER_CODE_MALE;

  /// 指定されたサイズのベスト画像URLを取得
  /// ベスト画像が存在しない場合はプロフィール画像の最初の画像
  /// プロフィール画像のリストが空の場合は null が返る
  String? getBestImageUrl(ImageSize size) {
    final bestImageUrl = bestImageUrls?.getImageUrl(size);
    if (bestImageUrl != null && bestImageUrl.isNotEmpty) {
      return bestImageUrl;
    }
    if (images.isNotEmpty) {
      return images.first;
    }
    return null;
  }
}
