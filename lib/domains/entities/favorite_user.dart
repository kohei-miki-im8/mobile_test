import 'package:econa_mobile_app/domains/entities/ekyc_level.dart';
import 'package:econa_mobile_app/domains/entities/login_status.dart';
import 'package:econa_mobile_app/domains/entities/requiring_review_profile_photo.dart';
import 'package:econa_mobile_app/domains/entities/signed_image_urls.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/gender_code.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/thumbnail_user.pb.dart';
import 'package:econa_mobile_app/presentations/util/age.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_user.freezed.dart';

/// お気に入りユーザーのエンティティ
/// 必要に応じてプロパティを編集する
@freezed
abstract class FavoriteUser with _$FavoriteUser {
  const factory FavoriteUser({
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
  }) = _FavoriteUser;

  const FavoriteUser._();

  /// APIレスポンスからエンティティを作成
  factory FavoriteUser.fromResponse(ThumbnailUser user) {
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

    return FavoriteUser(
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

/// FavoriteUserの拡張メソッド
extension FavoriteUserExtension on FavoriteUser {
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
