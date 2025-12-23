import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/gender_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/profile.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/signed_url.pb.dart';
import 'package:flutter/widgets.dart';

enum PhotoUrlKind {
  avatarIconWebpUrl,
  mediumThumbnailWebpUrl,
  smallThumbnailWebpUrl,
  largeThumbnailWebpUrl,
  nonResizedWebpUrl,
  originUrl,
}

/// プロフィールと取得したいタイプを渡すと、最適な1枚（isBestPhoto優先、なければ先頭）から該当URLを返す
/// SignedImageUrlsがわたってきた場合はその配列から最適な1枚を返す
/// どちらも指定している場合はプロフィールが優先して処理される
/// 指定タイプが空の場合は originUrl にのみフォールバックする
String resolvePhotoUrl({
  required PhotoUrlKind kind,
  Profile? profile,
  SignedImageUrls? urls,
  bool fallbackToOrigin = true,
}) {
  final String placeholder;
  SignedImageUrls? effectiveUrls = urls;

  if (profile != null) {
    placeholder = _placeholderAsset(
      kind: kind,
      genderCode: profile.genderCode,
    );
    final photos = profile.requiringReviewProfilePhotos;
    if (photos.isEmpty) return placeholder;

    // isBestPhoto を優先。なければ先頭。
    RequiringReviewProfilePhoto selected = photos.first;
    for (final p in photos) {
      if (p.isBestPhoto) {
        selected = p;
        break;
      }
    }

    if (!selected.hasCurrentSignedImageUrls()) {
      return placeholder;
    }

    effectiveUrls = selected.currentSignedImageUrls;
  } else {
    placeholder = _placeholderAsset(
      kind: kind,
    );
  }

  if(effectiveUrls == null) {
    return placeholder;
  }

  final preferred = switch (kind) {
    PhotoUrlKind.avatarIconWebpUrl =>
    (effectiveUrls.hasAvatarIconWebpUrl() && effectiveUrls.avatarIconWebpUrl.isNotEmpty)
        ? effectiveUrls.avatarIconWebpUrl
        : '',
    PhotoUrlKind.mediumThumbnailWebpUrl =>
    (effectiveUrls.hasMediumThumbnailWebpUrl() && effectiveUrls.mediumThumbnailWebpUrl.isNotEmpty)
        ? effectiveUrls.mediumThumbnailWebpUrl
        : '',
    PhotoUrlKind.smallThumbnailWebpUrl =>
    (effectiveUrls.hasSmallThumbnailWebpUrl() && effectiveUrls.smallThumbnailWebpUrl.isNotEmpty)
        ? effectiveUrls.smallThumbnailWebpUrl
        : '',
    PhotoUrlKind.largeThumbnailWebpUrl =>
    (effectiveUrls.hasLargeThumbnailWebpUrl() && effectiveUrls.largeThumbnailWebpUrl.isNotEmpty)
        ? effectiveUrls.largeThumbnailWebpUrl
        : '',
    PhotoUrlKind.nonResizedWebpUrl =>
    (effectiveUrls.hasNonResizedWebpUrl() && effectiveUrls.nonResizedWebpUrl.isNotEmpty)
        ? effectiveUrls.nonResizedWebpUrl
        : '',
    PhotoUrlKind.originUrl =>
    (effectiveUrls.hasOriginUrl() && effectiveUrls.originUrl.isNotEmpty)
        ? effectiveUrls.originUrl
        : '',
  };

  if (preferred.isNotEmpty) return preferred;

  // KindがなければOrigin、Originがなければプレースホルダ
  if (kind != PhotoUrlKind.originUrl && fallbackToOrigin) {
    if (effectiveUrls.hasOriginUrl() && effectiveUrls.originUrl.isNotEmpty) {
      return effectiveUrls.originUrl;
    }
  }
  return placeholder;
}

String _placeholderAsset({
  required PhotoUrlKind kind,
  GenderCode? genderCode,
}) {
  const defaultPlaceholder = 'assets/images/illusts/no_image_male';

  if(genderCode == null) {
    return '${defaultPlaceholder}_large.webp';
  }

  final basePath = switch (genderCode) {
    GenderCode.GENDER_CODE_MALE => 'assets/images/illusts/no_image_male',
    GenderCode.GENDER_CODE_FEMALE => 'assets/images/illusts/no_image_female',
    GenderCode.GENDER_CODE_UNSPECIFIED => defaultPlaceholder,
    GenderCode() => defaultPlaceholder,
  };

  final suffix = switch (kind) {
    PhotoUrlKind.avatarIconWebpUrl
    || PhotoUrlKind.smallThumbnailWebpUrl => 'small',
    PhotoUrlKind.mediumThumbnailWebpUrl => 'medium',
    PhotoUrlKind.largeThumbnailWebpUrl
    || PhotoUrlKind.originUrl => 'large',
    PhotoUrlKind.nonResizedWebpUrl => 'large',
  };

  return '${basePath}_$suffix.webp';
}

List<Image> resolveImagesFromUrls({
  required List<String> urls,
  required GenderCode genderCode,
  required PhotoUrlKind kind,
}) {
  final validUrls = urls.where((url) => url.isNotEmpty).toList();
  if (validUrls.isEmpty) {
    return [
      Image.asset(
        _placeholderAsset(
          genderCode: genderCode,
          kind: kind,
        ),
      ),
    ];
  }

  return validUrls
      .map(Image.network)
      .toList();
}

String resolveImageSize({
  required SignedImageUrls urls,
  required PhotoUrlKind kind,
}) {
  final photoUrl = switch (kind) {
    PhotoUrlKind.avatarIconWebpUrl => urls.avatarIconWebpUrl,
    PhotoUrlKind.smallThumbnailWebpUrl => urls.smallThumbnailWebpUrl,
    PhotoUrlKind.mediumThumbnailWebpUrl => urls.mediumThumbnailWebpUrl,
    PhotoUrlKind.largeThumbnailWebpUrl => urls.largeThumbnailWebpUrl,
    PhotoUrlKind.nonResizedWebpUrl => urls.nonResizedWebpUrl,
    PhotoUrlKind.originUrl => urls.originUrl,
  };

  if(photoUrl.isEmpty) {
    return urls.originUrl;
  } else {
    return photoUrl;
  }
}
