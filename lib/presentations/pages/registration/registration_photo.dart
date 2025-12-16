import 'dart:io';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/gender_code.pb.dart';
import 'package:econa_mobile_app/infrastructures/services/image_picker_service.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_plain_button.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/const.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/registration/registration_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/registration/registration_skip_modal.dart';
import 'package:econa_mobile_app/presentations/routes/econa_path.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/shared/photos/selected_photo_view_model.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegistrationPhoto extends HookConsumerWidget {
  const RegistrationPhoto({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CenterAppBar(
        titleText: '写真',
        backgroundColor: const Color(0xFFF0EFFD),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Assets.images.icons.back.image(height: 32, width: 36),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await PhotoSkipModal.show(context);
            },
            child: InnerShadowText(
              text: 'スキップ',
              textStyle: EconaTextStyle.labelMedium1140(
                color: EconaColor.gray200,
                shadows: EconaShadow.headlineShadows,
              ),
              innerShadowTextStyles: [
                EconaTextStyle.labelMedium1140(
                  foreground: EconaShadow().headlineInnerShadow,
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF0EFFD),
      body: Builder(
        builder: (context) {
          final imagePickerService = ref.read(imagePickerServiceProvider);
          final selectedPhotoNotifier = ref.read(selectedPhotoViewModelProvider.notifier);

          final gender = ref.read(registrationPageViewModelProvider).genderCodeAsEnum;

          List<MapEntry<String, String>> goodList;
          List<MapEntry<String, String>> badList;

          if(gender == GenderCode.GENDER_CODE_MALE) {
            goodList = EconaSamplePhoto.goodPhotoMale.entries.toList();
            badList = EconaSamplePhoto.badPhotoMale.entries.toList();
          } else {
            goodList = EconaSamplePhoto.goodPhotoFemale.entries.toList();
            badList = EconaSamplePhoto.badPhotoFemale.entries.toList();
          }

          return Center(
            child: Column(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 16),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Good！',
                    style: EconaTextStyle.labelMedium2140(
                      color: EconaColor.grayNormal,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        childAspectRatio: 113/183,
                      ),
                      itemCount: goodList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Image.asset(
                                  goodList[index].key,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              goodList[index].value,
                              style: EconaTextStyle.labelSmall140(
                                color: EconaColor.grayNormal,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(left: 16),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Bad！',
                    style: EconaTextStyle.labelMedium2140(
                      color: EconaColor.grayNormal,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.zero,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        childAspectRatio: 113/183,
                      ),
                      itemCount: badList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Image.asset(
                                  badList[index].key,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              badList[index].value,
                              style: EconaTextStyle.labelSmall140(
                                color: EconaColor.grayNormal,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                SafeArea(
                  child: Column(
                    spacing: 16,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        width: double.infinity,
                        height: 52,
                        child: EconaPlainButton(
                          text: 'ライブラリから選ぶ',
                          onPressed: () async {
                            final File? selectedImage = await imagePickerService.pickImageFromGallery();
                            if (selectedImage != null) {
                              // 選択された画像を保存
                              selectedPhotoNotifier.setSelectedPhoto(selectedImage);
                              if (context.mounted) {
                                await context.push(EconaPath.registrationPhotoPreview);
                              }
                            }
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        width: double.infinity,
                        height: 52,
                        child: EconaPlainButton(
                          text: '撮影する',
                          onPressed: () async {
                            final File? selectedImage = await imagePickerService.pickImageFromCamera();
                            if (selectedImage != null) {
                              // 選択された画像を保存
                              selectedPhotoNotifier.setSelectedPhoto(selectedImage);
                              // photo_edit画面に遷移
                              if (context.mounted) {
                                await context.push(EconaPath.registrationPhotoPreview);
                              }
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}