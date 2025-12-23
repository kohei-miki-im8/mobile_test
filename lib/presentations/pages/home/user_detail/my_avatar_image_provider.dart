import 'dart:ui';


import 'package:collection/collection.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/gender_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/get_profile.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final myAvatarImageProvider = FutureProvider<Image>((ref) async {
  final response = await ref.read(profileRepositoryProvider).getProfile(
    GetProfileRequest(),
  );


  final profile = response.profile;
  final fallBackAvatarImage = Image.asset(
    profile.genderCode == GenderCode.GENDER_CODE_MALE
        ? 'assets/images/illusts/no_image_male_small.webp'
        : 'assets/images/illusts/no_image_female_small.webp',
    fit: BoxFit.cover,
  );


  Image avatarImage = fallBackAvatarImage;
  if (profile.requiringReviewProfilePhotos.isNotEmpty) {
    final bestPhoto = profile.requiringReviewProfilePhotos
        .firstWhereOrNull((p) => p.isBestPhoto);
    if(bestPhoto != null) {
      final imageUrl = bestPhoto.currentSignedImageUrls.avatarIconWebpUrl.isNotEmpty
          ? bestPhoto.currentSignedImageUrls.avatarIconWebpUrl
          : bestPhoto.currentSignedImageUrls.originUrl;
      avatarImage = Image.network(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return fallBackAvatarImage;
        },
      );
    }
  }


  return avatarImage;
});


Future<void> prefetchMyAvatarImage(WidgetRef ref, BuildContext context) async {
  final img = await ref.read(myAvatarImageProvider.future);
  if (context.mounted) {
    await precacheImage(img.image, context);
  }
}