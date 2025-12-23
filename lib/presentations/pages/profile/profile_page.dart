import 'package:econa_mobile_app/domains/entities/edit_profile_field.dart';
import 'package:econa_mobile_app/domains/entities/profile_label_keys.dart';
import 'package:econa_mobile_app/domains/entities/requiring_review_profile_photo.dart'as entity;
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/photo/v1/update_profile_photo_display_order.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/profile.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/photo.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_tag.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/components/panel.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/helpers/label_localizer.dart';
import 'package:econa_mobile_app/presentations/pages/error_page.dart';
import 'package:econa_mobile_app/presentations/pages/home/user_detail/user_detail_page.dart';
import 'package:econa_mobile_app/presentations/pages/profile/edit_profile_list_model.dart';
import 'package:econa_mobile_app/presentations/pages/profile/profile_page_state.dart';
import 'package:econa_mobile_app/presentations/pages/profile/profile_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/profile/profile_photo_sheets.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/shared/econa_error_handler.dart';
import 'package:econa_mobile_app/presentations/shared/languages/languages.dart';
import 'package:econa_mobile_app/presentations/shared/photos/photo_url_resolver.dart';
import 'package:econa_mobile_app/presentations/shared/tags/view_models/tag_view_model.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_reorderable_grid_view/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final state = ref.watch(profilePageViewModelProvider);
    final notifier = ref.watch(profilePageViewModelProvider.notifier);

    // プロフィール詳細画面への多重遷移防止フラグ
    final isPushingUserDetail = useState(false);

    useEffect(() {
      final route = GoRouter.of(context);
      void listener() {
        // pop直後など、戻ってきたとみなせるタイミングで軽量再検証
        notifier.revalidate();
      }
      route.routerDelegate.addListener(listener);
      return () {
        route.routerDelegate.removeListener(listener);
      };
    }, const []);

    // プロフィールページ読み込み時のエラーでメンテナンスモードを検知
    ref.listen<ProfilePageState>(profilePageViewModelProvider, (previous, next) async {
      final error = next.error;
      if (error == null) {
        return;
      }

      await handleEconaError(context, error);
    });

    if (state.isLoading) {
      return const Center(child: EconaLoadingIndicator());
    }

    if (state.error != null) {
      return ErrorPage(
        title: 'エラーが発生しました。',
        message: state.error!.operationMessage,
        onRetry: notifier.initialFetchData,
      );
    }

    if (state.userStatus == null || state.profile == null) {
      return const Center(child: EconaLoadingIndicator());
    }

    final myUserId = state.userStatus!.userId;
    final optionalProfile = state.profile?.optionalProfile;

    return Scaffold(
      appBar: CenterAppBar(
        titleText: 'プロフィールの編集',
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
              if (isPushingUserDetail.value) {
                return;
              }
              isPushingUserDetail.value = true;

              try {
                await HomeUserDetailRouteData(
                  userId: myUserId,
                  pageType: DetailPageType.profile,
                ).push<void>(context);
              } finally {
                isPushingUserDetail.value = false;
              }
            },
            child: Text(
              'プレビュー',
              style: EconaTextStyle.regularMedium1160(
                color: EconaColor.purpleNormal,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: EconaColor.background,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 64),
          child: Column(
            spacing: 24,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if ((optionalProfile?.photoBonusGranted ?? false) == false)
                const PromptSetupProfile(),
              const MainPhoto(),
              const SubPhotos(),
              // 自己紹介文（他項目と同様のListTileスタイルで表示）
              ProfileItem(
                text: '自己紹介文',
                items: introductoryItems,
                grantPoint:
                    (optionalProfile?.introBonusGranted ?? false) ? null : 5,
              ),
              ProfileItem(text: '基本情報', items: basicProfileItems),
              ProfileItem(text: '容姿', items: appearanceItems),
              // ProfileItem(text: '性格', items: personalityLItems), // 未使用のためコメントアウト
              ProfileItem(text: '仕事・学歴', items: workEducationItems),
              ProfileItem(text: '生活・その他', items: lifestyleOtherItems),
              ProfileItem(text: '将来', items: futureItems),
              ProfileItem(text: '初回デート', items: firstDateItems),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileItem(text: 'Like', items: tagsItems),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: _SelectedTagsSection(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 設定を促すウィジェット
class PromptSetupProfile extends HookConsumerWidget {
  const PromptSetupProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ConvexPanel(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'あなたのベスト写真を登録しましょう',
                style: EconaTextStyle.labelMedium1140(
                  color: EconaColor.grayDarkActive,
                ),
              ),
              const SizedBox(width: 8),
              const GrantLikePoint(grantLikePoint: 5),
            ],
          ),
        ),
      ),
    );
  }
}

/// メイン写真
class MainPhoto extends HookConsumerWidget {
  const MainPhoto({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profilePageViewModelProvider);
    final optionalProfile = state.profile?.optionalProfile;
    final photos = state.profile?.requiringReviewProfilePhotos ?? const [];
    final bestPhoto = photos.where((p) => p.isBestPhoto).firstOrNull;
    final isPending = bestPhoto?.hasPendingSignedImageUrls() ?? false;

    String? bestPhotoUrl;
    if(bestPhoto != null) {
      if (bestPhoto.hasPendingSignedImageUrls()) {
        bestPhotoUrl = resolvePhotoUrl(
          urls: bestPhoto.pendingSignedImageUrls,
          kind: PhotoUrlKind.largeThumbnailWebpUrl,
        );
      } else if (bestPhoto.hasCurrentSignedImageUrls()) {
        bestPhotoUrl = resolvePhotoUrl(
          urls: bestPhoto.currentSignedImageUrls,
          kind: PhotoUrlKind.largeThumbnailWebpUrl,
        );
      } else {
        bestPhotoUrl = null;
      }
    } else {
      bestPhotoUrl = null;
    }


    return Column(
      children: [
        const ProfileTitle(text: 'メイン写真'),
        const ProfileSupplement(text: 'メイン写真はホーム画面に表示されます'),
        Container(
          width: 180,
          height: 291,
          alignment: Alignment.center,
          child: ShadowAndGradientBorderContainer(
            borderRadius: BorderRadius.circular(20),
            borderWidth: 1,
            gradients: const [],
            backgroundColor: EconaColor.grayLightActive,
            innerShadows: [
              BoxShadow(
                offset: const Offset(2, 2),
                blurRadius: 20,
                color: const Color(0xFF353E72).withValues(alpha: 0.1),
              ),
              BoxShadow(
                offset: const Offset(-1, -1),
                blurRadius: 3,
                color: const Color(0xFFFFFFFF).withValues(alpha: 0.8),
              ),
              BoxShadow(
                offset: const Offset(2, 2),
                blurRadius: 3,
                color: const Color(0xFF353E72).withValues(alpha: 0.18),
              ),
            ],
            dropShadows: const [],
            child: Stack(
              children: [
                // プレビュー or プレースホルダ
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () async {
                        await ProfilePhotoSheets.showActionSheet(
                          context,
                          isMain: true,
                          subIndex: null,
                          existingPhoto: bestPhoto != null
                              ? entity.RequiringReviewProfilePhoto.fromProtobuf(bestPhoto)
                              : null,
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: bestPhotoUrl != null
                            ? Image.network(bestPhotoUrl, fit: BoxFit.cover)
                            : Center(
                                child: Text(
                                  'あなたの写真',
                                  style: EconaTextStyle.headlineHeadline(
                                    color: EconaColor.gray800,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
                if (isPending)
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: IgnorePointer(
                        ignoring: true,
                        child: Container(
                          color: Colors.white.withValues(alpha: 0.65),
                          alignment: Alignment.center,
                          child: Text(
                            '審査中...',
                            style: EconaTextStyle.headline2(
                              color: EconaColor.grayDarkActive,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                // 左上のハートと数
                if ((optionalProfile?.photoBonusGranted ?? false) == false)
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: const EdgeInsets.only(left: 24, top: 24),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        padding: const EdgeInsets.only(left: 2, right: 8),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GrantLikePoint(grantLikePoint: 5),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (isPending)
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: IgnorePointer(
                        ignoring: true,
                        child: Container(
                          color: Colors.white.withValues(alpha: 0.65),
                          alignment: Alignment.center,
                          child: Text(
                            '審査中...',
                            style: EconaTextStyle.headline2(
                              color: EconaColor.grayDarkActive,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                if (bestPhoto == null)
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: ShadowAndGradientBorderContainer(
                        borderRadius: BorderRadius.circular(100),
                        borderWidth: 1,
                        gradients: [
                          LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color(0xFFD6E3F3).withValues(alpha: 1),
                              const Color(0xFFFFFFFF).withValues(alpha: 1),
                            ],
                            stops: const [0, 1],
                          ),
                          LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color(0xFFFFFFFF).withValues(alpha: 1),
                              const Color(0xFFFFFFFF).withValues(alpha: 0),
                            ],
                            stops: const [0, 1],
                          ),
                        ],
                        backgroundColor: const Color(0xFFF6FBFE),
                        innerShadows: [
                          BoxShadow(
                            offset: const Offset(-4, -4),
                            blurRadius: 9,
                            color:
                                const Color(0xFFFFFFFF).withValues(alpha: 0.88),
                          ),
                        ],
                        dropShadows: [
                          BoxShadow(
                            offset: const Offset(4, 4),
                            blurRadius: 20,
                            color:
                                const Color(0xFF6F75B0).withValues(alpha: 0.32),
                          ),
                          BoxShadow(
                            offset: const Offset(-6, -6),
                            blurRadius: 9,
                            color:
                                const Color(0xFFFFFFFF).withValues(alpha: 0.88),
                          ),
                          BoxShadow(
                            offset: const Offset(2, 2),
                            blurRadius: 4,
                            color:
                                const Color(0xFF7273AB).withValues(alpha: 0.1),
                          ),
                        ],
                        child: SizedBox.square(
                          dimension: 32,
                          child: InkWell(
                            child: Center(
                              child: Assets.images.icons.add.image(
                                height: 24,
                                width: 24,
                              ),
                            ),
                            onTap: () async {
                              await ProfilePhotoSheets.showActionSheet(
                                context,
                                isMain: true,
                                subIndex: null,
                                existingPhoto: bestPhoto != null
                                    ? entity.RequiringReviewProfilePhoto.fromProtobuf(bestPhoto)
                                    : null,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// サブ写真（趣味・好きなもの・旅先）
class SubPhotos extends HookConsumerWidget {
  const SubPhotos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profilePageViewModelProvider);
    final photoState = ref.read(photoRepositoryProvider);

    final profile = state.profile;
    final photos = profile?.requiringReviewProfilePhotos ??
        const <RequiringReviewProfilePhoto>[];
    final subPhotos = photos.where((p) => !p.isBestPhoto).toList();

    // サブ写真を表示順にまとめる
    final Map<int, List<RequiringReviewProfilePhoto>> groupedByOrder = {};
    for (final photo in subPhotos) {
      groupedByOrder
          .putIfAbsent(photo.currentDisplayOrder, () => [])
          .add(photo);
    }

    // サブ写真をスロット（2～8）に表示する順番を決定
    final displaySubPhotos = List<RequiringReviewProfilePhoto?>
        .generate(8, (index) {
      final order = index + 2;  // メイン写真分を除くため + 2
      final list = groupedByOrder[order];
      if (list == null || list.isEmpty) return null;
      return list.first;
    });

    // サブ写真IDから写真オブジェクトを即時参照するためのマップ
    final photoById = useMemoized(() => {
        for (final photo in subPhotos) photo.userProfilePhotoId: photo,
      }, [subPhotos],
    );

    // グリッド初期スロット（空は 'placeholder-$i' で表現）
    final initialSlots = useMemoized(
          () => <String?>[
        for (var i = 0; i < displaySubPhotos.length; i++)
          displaySubPhotos[i]?.userProfilePhotoId ?? 'placeholder-$i',
      ],
      [displaySubPhotos],
    );

    final slotsSignature = initialSlots.join('|');

    // スロットの現在状態（並び替え操作で更新される）
    final photoSlots = useState<List<String?>>(List<String?>.of(initialSlots));

    // 更新中は連続操作を抑止するフラグ
    final isUpdating = useState(false);

    // 初期スロットが変わったらUI状態を同期し直す
    useEffect(() {
      photoSlots.value = List<String?>.from(initialSlots);
      return null;
    }, [slotsSignature],);

    // グリッドのスクロール制御用
    final scrollController = useScrollController();

    return Column(
      children: [
        const ProfileTitle(text: '趣味・好きなもの・旅先'),
        const ProfileSupplement(text: '写真を長押しすると並び変えできます\n登録している写真タップでコメントを追加できます'),
        SizedBox(
          height: 200,
          child: ReorderableBuilder<String?>(
            scrollController: scrollController,
            onReorder: (reorderedListFunction) async {
              // 更新中は操作させない
              if (isUpdating.value) return;

              // 直前のスロット配列をスナップショット保存
              final previousOrder = List<String?>.from(photoSlots.value);

              // 安全に作業するためのコピー
              final workingCopy = List<String?>.from(photoSlots.value);

              // 更新するスロットのリスト
              final updateSlotList = <Future<void>>[];

              // 並び替えの処理
              final updatedOrder = List<String?>.from(
                reorderedListFunction(workingCopy),
              );

              // 楽観的UI変更
              photoSlots.value = updatedOrder;

              // 入れ替えでの更新処理
              for (int slotIndex = 0; slotIndex < updatedOrder.length; slotIndex++) {
                final photoId = updatedOrder[slotIndex];
                if (photoId == null || photoId.startsWith('placeholder-')) {
                  continue;
                }
                final photo = photoById[photoId];
                if (photo == null) continue;
                final desiredOrder = slotIndex + 2;
                if (photo.currentDisplayOrder == desiredOrder) continue;
                updateSlotList.add(
                  photoState.updateDisplayOrder(
                    UpdateProfilePhotoDisplayOrderRequest(
                      userProfilePhotoId: photoId,
                      displayOrder: desiredOrder,
                    ),
                  ),
                );
              }

              // 変化がなければ処理しない
              if (updateSlotList.isEmpty) return;

              // 更新フラグを立てる
              isUpdating.value = true;
              try {
                await Future.wait(updateSlotList);
              } on Exception catch (_) {
                // 失敗したら元に戻す
                photoSlots.value = previousOrder;
              } finally {
                isUpdating.value = false;
              }
            },
            builder: (children) {
              return GridView(
                controller: scrollController,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                children: children,
              );
            },
            children: [
              for (int slotIndex = 0; slotIndex < photoSlots.value.length; slotIndex++)
                _SubPhotoTile(
                  key: ValueKey(
                    'sub-photo-slot-$slotIndex-${photoSlots.value[slotIndex] ?? 'empty'}',
                  ),
                  photo: photoSlots.value[slotIndex] != null
                      && !photoSlots.value[slotIndex]!.startsWith('placeholder-')
                      ? photoById[photoSlots.value[slotIndex]]
                      : null,
                  onTap: () async {
                    final existing = photoSlots.value[slotIndex] != null
                        ? photoById[photoSlots.value[slotIndex]]
                        : null;
                    await ProfilePhotoSheets.showActionSheet(
                      context,
                      isMain: false,
                      subIndex: slotIndex,
                      existingPhoto: existing != null
                          ? entity.RequiringReviewProfilePhoto.fromProtobuf(existing)
                          : null,
                    );
                  },
                ),
            ],
          ),
        ),
      ],
    );
  }
}

/// サブ写真の枠
class _SubPhotoTile extends ConsumerWidget {
  const _SubPhotoTile({
    required this.photo,
    required this.onTap,
    super.key,
  });

  final RequiringReviewProfilePhoto? photo;
  final Future<void> Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPending = photo?.pendingSignedImageUrls != null;

    final effectiveUrls = isPending
        ? photo?.pendingSignedImageUrls
        : photo?.currentSignedImageUrls;

    final url = effectiveUrls != null
        ? resolvePhotoUrl(
          urls: effectiveUrls,
          kind: PhotoUrlKind.mediumThumbnailWebpUrl,
        )
        : null;

    // 写真が登録されていない場合はプレースホルダーを表示
    if (photo == null && url == null) {
      return InkWell(
        onTap: () async {
          await onTap();
        },
        borderRadius: BorderRadius.circular(20),
        child: const ConcavePanel(
          child: _SubPhotoPlaceholder(),
        )
      );
    }

    // 写真が登録されている場合
    return InkWell(
      onTap: () async {
        await onTap();
      },
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(url!, fit: BoxFit.cover),
            ),
          ),
          // 審査中の場合は「審査中...」を表示
          if (isPending)...[
            Positioned.fill(
              child: IgnorePointer(
                ignoring: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withValues(alpha: 0.65),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '審査中...',
                    style: EconaTextStyle.headline2(
                      color: EconaColor.grayDarkActive,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// サブ写真が設定されていな場合のプレースホルダー
class _SubPhotoPlaceholder extends StatelessWidget {
  const _SubPhotoPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(28),
      child: ConvexPanel(
        borderRadius: 100,
        child: Assets.images.icons.add.image(),
      ),
    );
  }
}

/// 基本情報群
class ProfileItem extends HookConsumerWidget {
  const ProfileItem({
    required this.items,
    required this.text,
    this.grantPoint,
    super.key,
  });

  final String text;
  final List<EditProfileListModel> items;
  final int? grantPoint;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profilePageViewModelProvider);

    return Column(
      children: [
        Row(
          children: [
            ProfileTitle(text: text),
            if (grantPoint != null) ...[
              const SizedBox(width: 16),
              GrantLikePoint(grantLikePoint: grantPoint!),
            ],
          ],
        ),
        ButtonListTile(
          items: items,
          itemBuilder: (item) => item,
          valueBuilder: (item) {
            final profile = state.profile;
            if (profile == null) return '';

            final field = EditProfileField.values.firstWhere(
                  (e) => e.name == item.fieldName,
              orElse: () => EditProfileField.tagCategory,
            );

            return getItem(field, profile);
          },
        ),
      ],
    );
  }

  String getItem(EditProfileField field, Profile profile) {
    switch (field) {
      case EditProfileField.nickname:
        final nickname =
            profile.updatableProfile.requiringReviewNickname;
        // 審査中の値があれば優先表示
        if (nickname.hasPendingNickname() &&
            nickname.pendingNickname.trim().isNotEmpty) {
          return nickname.pendingNickname;
        }
        return nickname.currentNickname;
      case EditProfileField.residenceRegion:
        return profile.updatableProfile.residenceRegion.name;
      case EditProfileField.introductory:
        if (profile.optionalProfile.hasRequiringReviewIntroductory()) {
          final introductory =
              profile.optionalProfile.requiringReviewIntroductory;
          // 審査中の値があれば優先表示
          if (introductory.hasPendingIntroductory() &&
              introductory.pendingIntroductory.trim().isNotEmpty) {
            return introductory.pendingIntroductory;
          }
          return introductory.currentIntroductory;
        }
        return '';
      case EditProfileField.bloodType:
        return profile.optionalProfile.hasBloodTypeCode()
            ? localizeLabel(profile.optionalProfile.bloodTypeCode.labelKey)
            : '';
      case EditProfileField.birthplaceRegion:
        return profile.optionalProfile.hasBirthplaceRegion()
            ? profile.optionalProfile.birthplaceRegion.name
            : '';
      case EditProfileField.height:
        return profile.optionalProfile.hasHeight()
            ? '${profile.optionalProfile.height}cm'
            : '';
      case EditProfileField.bodyType:
        return profile.optionalProfile.hasBodyTypeCode()
            ? localizeLabel(profile.optionalProfile.bodyTypeCode.labelKey)
            : '';
      case EditProfileField.occupation:
        return profile.optionalProfile.hasOccupationCode()
            ? localizeLabel(profile.optionalProfile.occupationCode.labelKey)
            : '';
      case EditProfileField.workplaceRegion:
        return profile.optionalProfile.hasWorkplaceRegion()
            ? profile.optionalProfile.workplaceRegion.name
            : '';
      case EditProfileField.salaryRange:
        return profile.optionalProfile.hasSalaryRangeCode()
            ? localizeLabel(profile.optionalProfile.salaryRangeCode.labelKey)
            : '';
      case EditProfileField.educationalBackground:
        return profile.optionalProfile.hasEducationalBackgroundCode()
            ? localizeLabel(profile.optionalProfile.educationalBackgroundCode.labelKey)
            : '';
      case EditProfileField.sibling:
        return profile.optionalProfile.hasSiblingCode()
            ? localizeLabel(profile.optionalProfile.siblingCode.labelKey)
            : '';
      case EditProfileField.roommate:
        return profile.optionalProfile.hasRoommateCode()
            ? localizeLabel(profile.optionalProfile.roommateCode.labelKey)
            : '';
      case EditProfileField.maritalHistory:
        return profile.optionalProfile.hasMaritalHistoryCode()
            ? localizeLabel(profile.optionalProfile.maritalHistoryCode.labelKey)
            : '';
      case EditProfileField.childSituation:
        return profile.optionalProfile.hasChildSituationCode()
            ? localizeLabel(profile.optionalProfile.childSituationCode.labelKey)
            : '';
      case EditProfileField.holidayType:
        return profile.optionalProfile.hasHolidayTypeCode()
            ? localizeLabel(profile.optionalProfile.holidayTypeCode.labelKey)
            : '';
      case EditProfileField.userLanguages:
        return profile.optionalProfile.userLanguageCodes.isNotEmpty
            ? profile.optionalProfile.userLanguageCodes
            .map(languageName)
            .join(', ')
            : '';
      case EditProfileField.drinkingAlcohol:
        return profile.optionalProfile.hasDrinkingAlcoholCode()
            ? localizeLabel(profile.optionalProfile.drinkingAlcoholCode.labelKey)
            : '';
      case EditProfileField.smoking:
        return profile.optionalProfile.hasSmokingCode()
            ? localizeLabel(profile.optionalProfile.smokingCode.labelKey)
            : '';
      case EditProfileField.sixteenPersonality:
        return profile.optionalProfile.hasSixteenPersonalityCode()
            ? localizeLabel(profile.optionalProfile.sixteenPersonalityCode.labelKey)
            : '';
      case EditProfileField.houseWork:
        return profile.optionalProfile.hasHouseWorkCode()
            ? localizeLabel(profile.optionalProfile.houseWorkCode.labelKey)
            : '';
      case EditProfileField.marriageAspiration:
        return profile.optionalProfile.hasMarriageAspirationCode()
            ? localizeLabel(profile.optionalProfile.marriageAspirationCode.labelKey)
            : '';
      case EditProfileField.childDesire:
        return profile.optionalProfile.hasChildDesireCode()
            ? localizeLabel(profile.optionalProfile.childDesireCode.labelKey)
            : '';
      case EditProfileField.datingPreference:
        return profile.optionalProfile.hasDatingPreferenceCode()
            ? localizeLabel(profile.optionalProfile.datingPreferenceCode.labelKey)
            : '';
      case EditProfileField.firstDateCostPreference:
        return profile.optionalProfile.hasFirstDateCostPreferenceCode()
            ? localizeLabel(profile.optionalProfile.firstDateCostPreferenceCode.labelKey)
            : '';
      case EditProfileField.firstDateLocationPreference:
        return profile.optionalProfile.hasFirstDateLocationPreferenceCode()
            ? localizeLabel(profile.optionalProfile.firstDateLocationPreferenceCode.labelKey)
            : '';
      case EditProfileField.birthday:
      case EditProfileField.tagCategory:
      case EditProfileField.tags:
      case EditProfileField.personalityTrait:
      case EditProfileField.sociability:
      case EditProfileField.photo:
      case EditProfileField.photoPreview:
      case EditProfileField.photoUpload:
        return '';
    }
  }
}

/// プロフィールタイトル
class ProfileTitle extends StatelessWidget {
  const ProfileTitle({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      alignment: Alignment.centerLeft,
      height: 44,
      child: InnerShadowText(
        text: text,
        textStyle: EconaTextStyle.labelMedium2140(
          color: EconaColor.grayNormal,
          shadows: EconaShadow.headlineShadows,
        ),
        innerShadowTextStyles: [
          EconaTextStyle.labelMedium2140(
            foreground: EconaShadow().headlineInnerShadow,
          ),
        ],
      ),
    );
  }
}

/// プロフィール要約
class ProfileSupplement extends StatelessWidget {
  const ProfileSupplement({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(bottom: 24),
      child: Text(
        text,
        style: EconaTextStyle.regularSmall140(
          color: EconaColor.grayDarkActive,
        ),
      ),
    );
  }
}

/// 選択済みのユーザータグ表示（タグが設定されている場合のみ表示）
class _SelectedTagsSection extends HookConsumerWidget {
  const _SelectedTagsSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 初回だけデータの準備をキック（マスタ/ユーザータグ）
    useEffect(() {
      Future.microtask(
          () => ref.read(tagViewModelProvider.notifier).ensureDataLoaded());
      return null;
    }, const []);

    final tagStateAsync = ref.watch(tagViewModelProvider);
    final userTags = tagStateAsync.valueOrNull?.userTags;

    if (userTags == null || userTags.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final t in userTags) EconaTag(tag: t.tagName),
          ],
        ),
      ],
    );
  }
}

/// 各項目のListTile
class ButtonListTile extends HookConsumerWidget {
  const ButtonListTile({
    required this.items,
    required this.itemBuilder,
    this.valueBuilder,
    super.key,
  });

  final List<EditProfileListModel> items;
  final String Function(String itemName) itemBuilder;
  final String Function(EditProfileListModel item)? valueBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        String? valueText = valueBuilder?.call(item);
        bool isUnspecified =
            valueText == null || valueText.isEmpty || valueText == '-';

        // タグが設定済みの場合は「未設定」を表示しない
        if (item.fieldName == EditProfileField.tagCategory.name) {
          final tagState = ref.watch(tagViewModelProvider);
          final hasTags =
              (tagState.valueOrNull?.userTags?.isNotEmpty ?? false) ||
                  (tagState.valueOrNull?.selectedTagIds.isNotEmpty ?? false);
          if (hasTags) {
            isUnspecified = false;
            valueText = '';
          }
        }

        final AlignmentGeometry valueTextAlign;
        final EdgeInsets valueTextPadding;
        if (item.fieldName == EditProfileField.introductory.name) {
          valueTextAlign = Alignment.centerLeft;
          valueTextPadding = const EdgeInsets.only(left: 10);
        } else {
          valueTextAlign = Alignment.centerRight;
          valueTextPadding = EdgeInsets.zero;
        }
        final isPending = _isPendingField(ref, item);

        final listTile = ListTile(
          contentPadding: EdgeInsets.zero,
          title: Row(
            children: [
              if (item.name != null) ...[
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    itemBuilder(item.name!),
                    style: EconaTextStyle.regularMedium1160(
                      color: EconaColor.grayNormal,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
              Expanded(
                child: Align(
                  alignment: valueTextAlign,
                  child: Container(
                    padding: valueTextPadding,
                    child: Text(
                      isUnspecified ? '未設定' : valueText!,
                      style: EconaTextStyle.regularSmall140(
                        color: isUnspecified
                            ? EconaColor.feedbackRed400
                            : EconaColor.purpleNormal,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines:
                          item.fieldName == EditProfileField.introductory.name
                              ? 9
                              : null,
                    ),
                  ),
                ),
              ),
              Assets.images.icons.chevronRight.svg(height: 24, width: 24),
            ],
          ),
          onTap: () async {
            await EditProfileRouteData(fieldName: item.fieldName).push<void>(context);
          },
        );

        if (!isPending) return listTile;

        return Stack(
          children: [
            listTile,
            Positioned.fill(
              child: IgnorePointer(
                ignoring: true,
                child: Container(
                  color: Colors.white.withValues(alpha: 0.65),
                  alignment: Alignment.center,
                  child: Text(
                    '審査中...',
                    style: EconaTextStyle.headline2(
                      color: EconaColor.grayDarkActive,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  bool _isPendingField(WidgetRef ref, EditProfileListModel item) {
    final state = ref.read(profilePageViewModelProvider).profile;
    if (state == null) return false;

    if (item.fieldName == EditProfileField.nickname.name) {
      if (!state.updatableProfile.hasRequiringReviewNickname()) {
        return false;
      }
      final rr = state.updatableProfile.requiringReviewNickname;
      if (!rr.hasPendingNickname()) return false;
      final pending = rr.pendingNickname.trim();
      return pending.isNotEmpty && pending.toLowerCase() != 'null';
    } else if (item.fieldName == EditProfileField.introductory.name) {
      if (!state.optionalProfile.hasRequiringReviewIntroductory()) {
        return false;
      }
      final rr = state.optionalProfile.requiringReviewIntroductory;
      if (!rr.hasPendingIntroductory()) return false;
      final pending = rr.pendingIntroductory.trim();
      return pending.isNotEmpty && pending.toLowerCase() != 'null';
    }

    return false;
  }
}

/// 付与いいね数
class GrantLikePoint extends StatelessWidget {
  const GrantLikePoint({
    required this.grantLikePoint,
    super.key,
  });

  final int grantLikePoint;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Assets.images.icons.likeHeart.image(height: 24, width: 24),
        Text(
          '×$grantLikePoint',
          style: EconaTextStyle.labelSmall140(
            color: EconaColor.grayNormal,
          ),
        ),
      ],
    );
  }
}
