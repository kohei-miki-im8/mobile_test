import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/signed_url.pb.dart'
    as pb;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signed_image_urls.freezed.dart';

/// 画像サイズを表すenum
enum ImageSize {
  /// オリジナルサイズ
  origin,

  /// リサイズなしWebP
  nonResizedWebp,

  /// 大サイズサムネイルWebP
  largeThumbnailWebp,

  /// 中サイズサムネイルWebP
  mediumThumbnailWebp,

  /// 小サイズサムネイルWebP
  smallThumbnailWebp,

  /// アバターアイコンWebP
  avatarIconWebp,
}

/// 署名付き画像URLを表すエンティティ
@freezed
abstract class SignedImageUrls with _$SignedImageUrls {
  const factory SignedImageUrls({
    required String? originUrl,
    required String? nonResizedWebpUrl,
    required String? largeThumbnailWebpUrl,
    required String? mediumThumbnailWebpUrl,
    required String? smallThumbnailWebpUrl,
    required String? avatarIconWebpUrl,
  }) = _SignedImageUrls;

  /// protobufのSignedImageUrlsからエンティティを作成する
  factory SignedImageUrls.fromProtobuf(pb.SignedImageUrls protobuf) {
    return SignedImageUrls(
      originUrl: protobuf.hasOriginUrl() ? protobuf.originUrl : null,
      nonResizedWebpUrl:
          protobuf.hasNonResizedWebpUrl() ? protobuf.nonResizedWebpUrl : null,
      largeThumbnailWebpUrl: protobuf.hasLargeThumbnailWebpUrl()
          ? protobuf.largeThumbnailWebpUrl
          : null,
      mediumThumbnailWebpUrl: protobuf.hasMediumThumbnailWebpUrl()
          ? protobuf.mediumThumbnailWebpUrl
          : null,
      smallThumbnailWebpUrl: protobuf.hasSmallThumbnailWebpUrl()
          ? protobuf.smallThumbnailWebpUrl
          : null,
      avatarIconWebpUrl:
          protobuf.hasAvatarIconWebpUrl() ? protobuf.avatarIconWebpUrl : null,
    );
  }
}

/// SignedImageUrlsの拡張メソッド
extension SignedImageUrlsExtension on SignedImageUrls {
  /// 指定された画像サイズのURLを取得する
  String? getImageUrl(ImageSize size) {
    switch (size) {
      case ImageSize.origin:
        return originUrl;
      case ImageSize.nonResizedWebp:
        return nonResizedWebpUrl;
      case ImageSize.largeThumbnailWebp:
        return largeThumbnailWebpUrl;
      case ImageSize.mediumThumbnailWebp:
        return mediumThumbnailWebpUrl;
      case ImageSize.smallThumbnailWebp:
        return smallThumbnailWebpUrl;
      case ImageSize.avatarIconWebp:
        return avatarIconWebpUrl;
    }
  }
}
