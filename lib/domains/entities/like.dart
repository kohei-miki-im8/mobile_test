import 'package:econa_mobile_app/domains/entities/requiring_review_profile_photo.dart';
import 'package:econa_mobile_app/domains/entities/signed_image_urls.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/certificate_level_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/gender_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/user_activity_tag.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/thumbnail_user.pb.dart'
    as proto;
import 'package:econa_mobile_app/presentations/util/age.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'like.freezed.dart';

@freezed
abstract class Like with _$Like {
  const factory Like({
    required String userId,
    required String nickname,
    required int age,
    required String city,
    required List<String> imageUrls,
    required UserActivityTag userActivityTag,
    required CertificateLevelCode certificateLevelCode,
    required GenderCode genderCode,
    required SignedImageUrls? bestImageUrls,
    String? userLikeId,
    @Default(false) bool hasSuperLikeMessage,
  }) = _Like;

  const Like._();

  factory Like.fromProto(proto.ThumbnailUser u) {
    final profile = u.profile.updatableProfile;
    var age = 0;
    if (u.profile.updatableProfile.hasBirthday()) {
      age = calculateAge(u.profile.updatableProfile.birthday);
    }
    final images = <String>[];
    if (u.profile.requiringReviewProfilePhotos.isNotEmpty &&
        u.profile.requiringReviewProfilePhotos.first.hasCurrentSignedImageUrls()) {
      images.add(
        u.profile.requiringReviewProfilePhotos.first.currentSignedImageUrls
            .nonResizedWebpUrl,
      );
    }

    // プロフィール写真のリストを作成
    final profilePhotos = u.profile.requiringReviewProfilePhotos
        .map(RequiringReviewProfilePhoto.fromProtobuf)
        .toList();

    // ベスト画像のSignedImageUrlsエンティティを取得
    final bestImageUrls = profilePhotos.getBestImageUrls();

    final bool hasMsg = u.hasLike() &&
        u.like.hasSuperLikeMessage() &&
        u.like.superLikeMessage.isNotEmpty;

    return Like(
      userId: u.userId,
      userLikeId: u.hasLike() ? u.like.userLikeId : null,
      nickname: profile.requiringReviewNickname.currentNickname,
      age: age,
      city: profile.residenceRegion.name,
      imageUrls: images,
      userActivityTag: u.userActivityTag,
      certificateLevelCode: u.userStatus.certificateLevelCode,
      genderCode: u.profile.genderCode,
      bestImageUrls: bestImageUrls,
      hasSuperLikeMessage: hasMsg,
    );
  }
}

/// Likeの拡張メソッド
extension LikeExtension on Like {
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
    if (imageUrls.isNotEmpty) {
      return imageUrls.first;
    }
    return null;
  }
}
