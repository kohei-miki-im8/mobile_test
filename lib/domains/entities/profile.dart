import 'package:econa_mobile_app/domains/entities/ekyc_level.dart';
import 'package:econa_mobile_app/domains/entities/login_status.dart';
import 'package:econa_mobile_app/domains/entities/requiring_review_profile_photo.dart';
import 'package:econa_mobile_app/domains/entities/signed_image_urls.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/certificate_level_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/gender_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/get_profile.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/profile.pb.dart'
    as pb;
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/thumbnail_user.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/user.pb.dart'
    as pb;
import 'package:econa_mobile_app/presentations/components/econa_badge.dart';
import 'package:econa_mobile_app/presentations/shared/photos/photo_url_resolver.dart';
import 'package:econa_mobile_app/presentations/components/verified_badge.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';

/// プロフィール情報を表すエンティティ
@freezed
abstract class Profile with _$Profile {
  const factory Profile({
    required List<Image> images,
    required String name,
    required int? age,
    required String location,
    required String userId,
    required SignedImageUrls? bestImageUrls,
    @Default(GenderCode.GENDER_CODE_UNSPECIFIED) GenderCode genderCode,
    @Default(false) bool isFavorite,
    @Default(CertificateLevel.unspecified) CertificateLevel certificateLevel,
    @Default(LoginStatus.unspecified) LoginStatus loginStatus,
    BadgeType? badgeType,
  }) = _Profile;

  /// GetProfileResponseからProfileエンティティを作成する
  factory Profile.fromProfileResponse(
    GetProfileResponse response,
    String userId,
  ) {
    final profile = response.profile;

    // プロフィール情報を取得
    final name = Profile.getNicknameFromProfileProto(profile);
    final age = Profile.getCalculatedAgeFromProfileProto(profile);
    final location = Profile.getResidenceLocationFromProfileProto(profile);

    // 性別コードを取得
    final genderCode = Profile.getGenderCodeFromProfileProto(profile);

    // プロフィール写真をエンティティに変換
    final requiringReviewProfilePhotos = profile.requiringReviewProfilePhotos
        .map(RequiringReviewProfilePhoto.fromProtobuf)
        .toList();

    // プロフィール画像を取得
    final urls = requiringReviewProfilePhotos
        .getImageUrls(PhotoUrlKind.largeThumbnailWebpUrl);

    final images = resolveImagesFromUrls(
      urls: urls,
      genderCode: genderCode,
      kind: PhotoUrlKind.largeThumbnailWebpUrl,
    );

    // ベスト画像のSignedImageUrlsエンティティを取得
    final bestImageUrls = requiringReviewProfilePhotos.getBestImageUrls();

    return Profile(
      name: name,
      age: age,
      location: location,
      images: images,
      userId: userId,
      bestImageUrls: bestImageUrls,
      genderCode: genderCode,
    );
  }

  /// ThumbnailUserからProfileを作成する
  factory Profile.fromThumbnailUser(ThumbnailUser thumbnailUser) {
    final profile = thumbnailUser.profile;
    final userStatus = thumbnailUser.userStatus;

    // プロフィール情報を取得
    final name = Profile.getNicknameFromProfileProto(profile);
    final age = Profile.getCalculatedAgeFromProfileProto(profile);
    final location = Profile.getResidenceLocationFromProfileProto(profile);

    // バッジタイプを設定
    final badgeType = Profile.getBadgeTypeFromThumbnailUser(thumbnailUser);

    // 認証状態を確認
    final certificateLevel =
        Profile.getCertificateLevelFromUserStatus(userStatus);

    // ログインステータスを設定
    final loginStatus = Profile.getLoginStatusFromThumbnailUser(thumbnailUser);

    // 性別コードを取得
    final genderCode = Profile.getGenderCodeFromProfileProto(profile);

    // プロフィール写真を変換
    final requiringReviewProfilePhotos = profile.requiringReviewProfilePhotos
        .map(RequiringReviewProfilePhoto.fromProtobuf)
        .toList();

    // プロフィール画像を取得
    final urls = requiringReviewProfilePhotos
        .getImageUrls(PhotoUrlKind.largeThumbnailWebpUrl);

    final images = resolveImagesFromUrls(
      urls: urls,
      genderCode: genderCode,
      kind: PhotoUrlKind.largeThumbnailWebpUrl,
    );

    // ベスト画像のSignedImageUrlsエンティティを取得
    final bestImageUrls = requiringReviewProfilePhotos.getBestImageUrls();

    return Profile(
      name: name,
      age: age,
      location: location,
      images: images,
      userId: thumbnailUser.userId,
      bestImageUrls: bestImageUrls,
      badgeType: badgeType,
      certificateLevel: certificateLevel,
      loginStatus: loginStatus,
      genderCode: genderCode,
    );
  }

  // ===== Protobuf変換メソッド =====

  /// protobufのProfileからニックネームを取得
  static String getNicknameFromProfileProto(pb.Profile profile) {
    if (!profile.hasUpdatableProfile()) return '未設定';
    final updatableProfile = profile.updatableProfile;
    if (!updatableProfile.hasRequiringReviewNickname()) return '未設定';
    if (!updatableProfile.requiringReviewNickname.hasCurrentNickname()) {
      return '未設定';
    }
    return updatableProfile.requiringReviewNickname.currentNickname;
  }

  /// protobufのProfileから年齢を計算して取得
  static int? getCalculatedAgeFromProfileProto(pb.Profile profile) {
    if (!profile.hasUpdatableProfile()) return null;
    final updatableProfile = profile.updatableProfile;
    if (!updatableProfile.hasBirthday()) return null;

    final birthday = updatableProfile.birthday;
    final now = DateTime.now();
    final birthDate = DateTime.fromMillisecondsSinceEpoch(
      birthday.seconds.toInt() * 1000,
    );
    final calculatedAge = now.year - birthDate.year;
    return now.month < birthDate.month ||
            (now.month == birthDate.month && now.day < birthDate.day)
        ? calculatedAge - 1
        : calculatedAge;
  }

  /// protobufのProfileから居住地を取得
  static String getResidenceLocationFromProfileProto(pb.Profile profile) {
    if (!profile.hasUpdatableProfile()) return '未設定';
    final updatableProfile = profile.updatableProfile;
    if (!updatableProfile.hasResidenceRegion()) return '未設定';
    return updatableProfile.residenceRegion.name;
  }

  /// protobufのProfileから性別コードを取得
  static GenderCode getGenderCodeFromProfileProto(pb.Profile profile) {
    if (!profile.hasGenderCode()) return GenderCode.GENDER_CODE_UNSPECIFIED;
    return profile.genderCode;
  }

  /// ThumbnailUserからバッジタイプを取得
  static BadgeType? getBadgeTypeFromThumbnailUser(ThumbnailUser thumbnailUser) {
    if (!thumbnailUser.hasNewbieTag()) return null;
    return BadgeType.fromNewbieTag(thumbnailUser.newbieTag);
  }

  /// UserStatusから認証レベルを取得
  static CertificateLevel getCertificateLevelFromUserStatus(
    pb.UserStatus userStatus,
  ) {
    if (!userStatus.hasCertificateLevelCode()) {
      return CertificateLevel.unspecified;
    }
    return CertificateLevel.fromCertificateLevelCode(
      userStatus.certificateLevelCode,
    );
  }

  /// ThumbnailUserからログインステータスを取得
  static LoginStatus getLoginStatusFromThumbnailUser(
    ThumbnailUser thumbnailUser,
  ) {
    if (!thumbnailUser.hasUserActivityTag()) return LoginStatus.unspecified;
    return LoginStatus.fromUserActivityTag(thumbnailUser.userActivityTag);
  }
}

/// Profileの拡張メソッド
extension ProfileExtension on Profile {
  /// 年齢テキストを取得
  String get ageText {
    if (age == null) return '未設定';
    if (age! < 0 || age! > 150) return '未設定';
    return '$age歳';
  }

  /// 市区町村テキストを取得
  String get cityText => location;

  /// 本人確認済みかどうかを取得
  bool get isIdentityVerified =>
      certificateLevel.code ==
          CertificateLevelCode.CERTIFICATE_LEVEL_CODE_VERIFIED ||
      certificateLevel.code ==
          CertificateLevelCode.CERTIFICATE_LEVEL_CODE_SINGLE_CERTIFIED;

  /// 男性かどうかを取得
  bool get isMale => genderCode == GenderCode.GENDER_CODE_MALE;

  /// 認証バッジのリストを取得
  List<String> get verifiedBadges {
    final badges = <String>[];

    if (certificateLevel.isVerified) {
      badges.add('本人確認');
    } else if (certificateLevel.isSingleVerified) {
      badges
        ..add('本人確認')
        ..add('独身証明');
    }

    return badges;
  }

  /// 指定されたサイズのベスト画像URLを取得
  /// ベスト画像が存在しない場合はプロフィール画像の最初の画像
  /// プロフィール画像のリストが空の場合は null が返る
  String? getBestImageUrl(ImageSize size) {
    return bestImageUrls?.getImageUrl(size);
  }
}
