import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/loading_overlay.dart';
import 'package:econa_mobile_app/presentations/components/square_toggle_button.dart';
import 'package:econa_mobile_app/presentations/const.dart' as $const;
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/shared/tags/view_models/tag_view_model.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileBaseTagCategory extends HookConsumerWidget {

  const ProfileBaseTagCategory({
    required this.title,
    required this.description,
    required this.buttonText,
    required this.buttonTextWithCount,
    required this.onNext,
    this.actions,
    this.onBackPressed,
    this.isRegistrationFlow = false,
    super.key,
  });

  // 必須パラメータ
  final String title;
  final String description;
  final String buttonText;
  final String buttonTextWithCount;
  final Future<void> Function() onNext;
  
  // オプショナルパラメータ
  final List<Widget>? actions;
  final VoidCallback? onBackPressed;
  final bool isRegistrationFlow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tagViewModelProvider);
    final notifier = ref.watch(tagViewModelProvider.notifier);
    final isLoading = useState(true); // 読み込み状態を管理

    // データがない場合のみ取得
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        try {
          isLoading.value = true; // 読み込み開始
          await notifier.ensureDataLoaded();
          await notifier.loadTagsForSelectedCategories();
        } catch (e) {
          /// Todo: EconaError
        } finally {
          isLoading.value = false; // 読み込み完了
        }
      });
      return null;
    }, []);

    return Scaffold(
      appBar: CenterAppBar(
        titleText: title,
        backgroundColor: const Color(0xFFF0EFFD),
        leading: IconButton(
          onPressed: onBackPressed ?? () => context.pop(),
          icon: Assets.images.icons.back.image(height: 32, width: 36),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        actions: actions,
      ),
      backgroundColor: const Color(0xFFF0EFFD),
      body: LoadingOverlay(
        isLoading: isLoading.value,
        message: 'データを読み込み中...',
        child: state.when(
          data: (data) => Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.all(24),
                    child: Text(
                      description,
                      style: EconaTextStyle.labelSmall100(
                        color: EconaColor.grayNormal,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 120),
                      child: data.tagCategories == null
                          ? const Center(child: EconaLoadingIndicator())
                          : GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 1,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                              ),
                              itemCount: data.tagCategories!.length,
                              itemBuilder: (context, index) {
                                return SquareToggleButton(
                                  height: 100,
                                  width: 100,
                                  icon: $const.TagCategoryIcon.icon[index].icon,
                                  text: data.tagCategories![index].categoryName,
                                  textStyle: EconaTextStyle.labelSmall22(
                                    color: EconaColor.grayDarkActive,
                                  ),
                                  isSelected: data.isTagCategorySelected(index),
                                  onTap: isLoading.value ? null : () { // 読み込み中は無効化
                                    notifier.toggleTagCategorySelection(index);
                                  },
                                );
                              },
                            ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 52,
                  width: 339,
                  margin: const EdgeInsets.only(left: 35, top: 25, right: 35, bottom: 60),
                  child: EconaGradientButton(
                    expandWidth: true,
                    onPressed: () async {
                      if (data.hasSelectedTagCategories && !isLoading.value) { // 読み込み中は無効化
                        try {
                          await onNext();
                        } catch (e) {
                          if (context.mounted) {
                            await EconaNotification.showTopToast(
                              context,
                              message: 'タグの読み込みに失敗しました',
                              duration: const Duration(seconds: 2),
                            );
                          }
                        }
                      }
                    },
                    text: isLoading.value
                        ? '読み込み中...'
                        : data.hasSelectedTagCategories
                        ? '$buttonTextWithCount (${data.selectedTagCategoryCount}個選択中)'
                        : buttonText,
                  ),
                ),
              )
            ]
          ),
          loading: () => const Center(child: EconaLoadingIndicator()),
          error: (error, stackTrace) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('エラーが発生しました: $error'),
                ElevatedButton(
                  onPressed: () {
                    ref.invalidate(tagViewModelProvider);
                  },
                  child: const Text('再試行'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 