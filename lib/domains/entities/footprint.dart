import 'package:econa_mobile_app/domains/entities/requiring_review_profile_photo.dart';
import 'package:econa_mobile_app/domains/entities/signed_image_urls.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/certificate_level_code.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/gender_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/user_activity_tag.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/thumbnail_user.pb.dart'
    as proto;
import 'package:econa_mobile_app/presentations/util/age.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'footprint.freezed.dart';

/// 足あと用エンティティ
/// 現状は `ThumbnailUser` をもとに必要情報のみ保持
@freezed
abstract class Footprint with _$Footprint {
  const factory Footprint({
    required String userId,
    required String nickname,
    required int age,
    required String city,
    required List<String> imageUrls,
    required UserActivityTag userActivityTag,
    required CertificateLevelCode certificateLevelCode,
    required SignedImageUrls? bestImageUrls,
    @Default(GenderCode.GENDER_CODE_UNSPECIFIED) GenderCode genderCode,
  }) = _Footprint;

  const Footprint._();

  factory Footprint.fromProto(proto.ThumbnailUser u) {
    final up = u.profile.updatableProfile;

    var age = 0;
    if (up.hasBirthday()) {
      age = calculateAge(up.birthday);
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

    return Footprint(
      userId: u.userId,
      nickname: up.requiringReviewNickname.currentNickname,
      age: age,
      city: up.residenceRegion.name,
      imageUrls: images,
      userActivityTag: u.userActivityTag,
      certificateLevelCode: u.userStatus.certificateLevelCode,
      bestImageUrls: bestImageUrls,
      genderCode: u.profile.hasGenderCode()
          ? u.profile.genderCode
          : GenderCode.GENDER_CODE_UNSPECIFIED,
    );
  }
}

/// Footprintの拡張メソッド
extension FootprintExtension on Footprint {
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
