import 'package:econa_mobile_app/domains/entities/signed_image_urls.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/profile.pb.dart'
    as pb;
import 'package:econa_mobile_app/presentations/shared/photos/photo_url_resolver.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'requiring_review_profile_photo.freezed.dart';

/// プロフィール写真を表すエンティティ
@freezed
abstract class RequiringReviewProfilePhoto with _$RequiringReviewProfilePhoto {
  const factory RequiringReviewProfilePhoto({
    required String? userProfilePhotoId,
    required SignedImageUrls? currentSignedImageUrls,
    required SignedImageUrls? pendingSignedImageUrls,
    required int? currentDisplayOrder,
    @Default(false) bool isBestPhoto,
    @Default(false) bool alreadySkipped,
    @Default('') String caption,
  }) = _RequiringReviewProfilePhoto;

  /// protobufのRequiringReviewProfilePhotoからエンティティを作成する
  factory RequiringReviewProfilePhoto.fromProtobuf(
    pb.RequiringReviewProfilePhoto protobuf,
  ) {
    return RequiringReviewProfilePhoto(
      userProfilePhotoId:
          protobuf.hasUserProfilePhotoId() ? protobuf.userProfilePhotoId : null,
      currentSignedImageUrls: protobuf.hasCurrentSignedImageUrls()
          ? SignedImageUrls.fromProtobuf(protobuf.currentSignedImageUrls)
          : null,
      pendingSignedImageUrls: protobuf.hasPendingSignedImageUrls()
          ? SignedImageUrls.fromProtobuf(protobuf.pendingSignedImageUrls)
          : null,
      isBestPhoto: protobuf.hasIsBestPhoto() && protobuf.isBestPhoto,
      alreadySkipped: protobuf.hasAlreadySkipped() && protobuf.alreadySkipped,
      currentDisplayOrder: protobuf.hasCurrentDisplayOrder()
          ? protobuf.currentDisplayOrder
          : null,
      // TODO: 仮データ。実際のAPIレスポンスに合わせて修正
      // caption: protobuf.hasCaption() ? protobuf.caption : '',
      caption: '',
    );
  }
}

/// RequiringReviewProfilePhotoのリストに対する拡張メソッド
extension RequiringReviewProfilePhotoListExtension
    on List<RequiringReviewProfilePhoto> {
  /// ベスト画像のSignedImageUrlsエンティティを取得
  /// ベスト画像が存在する場合はそれを返し、存在しない場合は最初の画像を返す
  /// プロフィール画像のリストが空の場合は null を返す
  SignedImageUrls? getBestImageUrls() {
    if (isEmpty) {
      return null;
    }

    // ベスト画像を探す
    final bestPhoto = where((photo) => photo.isBestPhoto).firstOrNull;

    if (bestPhoto?.currentSignedImageUrls != null) {
      return bestPhoto!.currentSignedImageUrls;
    }

    // ベスト画像がない場合は最初の画像を返す
    final firstPhoto = first;
    return firstPhoto.currentSignedImageUrls;
  }

  /// 指定された画像サイズのURLリストを取得
  /// 空のURLは除外される
  List<String> getImageUrls(PhotoUrlKind kind) {
    return where((p) => p.currentSignedImageUrls != null)
        .map((p) {
          final urls = p.currentSignedImageUrls!;
          return switch (kind) {
            PhotoUrlKind.avatarIconWebpUrl => urls.avatarIconWebpUrl ?? '',
            PhotoUrlKind.mediumThumbnailWebpUrl =>
              urls.mediumThumbnailWebpUrl ?? '',
            PhotoUrlKind.smallThumbnailWebpUrl =>
              urls.smallThumbnailWebpUrl ?? '',
            PhotoUrlKind.largeThumbnailWebpUrl =>
              urls.largeThumbnailWebpUrl ?? '',
            PhotoUrlKind.nonResizedWebpUrl => urls.nonResizedWebpUrl ?? '',
            PhotoUrlKind.originUrl => urls.originUrl ?? '',
          };
        })
        .where((u) => u.isNotEmpty)
        .toList();
  }
}
