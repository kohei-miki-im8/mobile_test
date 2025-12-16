import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/square_toggle_button.dart';
import 'package:econa_mobile_app/presentations/const.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/shared/tags/view_models/tag_view_model.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileBaseTag extends HookConsumerWidget {
  const ProfileBaseTag({
    required this.title,
    required this.description,
    required this.buttonText,
    required this.buttonTextWithCount,
    required this.noSelectionText,
    required this.onSave,
    this.actions,
    this.onBackPressed,
    this.isRegistrationFlow = false,
    this.popCount,
    super.key,
  });

  // 必須パラメータ
  final String title;
  final String description;
  final String buttonText;
  final String buttonTextWithCount;
  final String noSelectionText;
  final Future<void> Function() onSave;
  
  // オプショナルパラメータ
  final List<Widget>? actions;
  final VoidCallback? onBackPressed;
  final bool isRegistrationFlow;
  final int? popCount; // 保存後に戻るページ数



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tagViewModelProvider);
    
    // データがない場合のみ取得
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        try {
          await ref.read(tagViewModelProvider.notifier).ensureDataLoaded();
        } catch (e) {
          /// Todo: EconaError
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
      body: state.when(
        data: (data) {
          final selectedCategories = data.getSelectedTagCategories();
          
          if (selectedCategories.isEmpty) {
            return Center(
              child: Text(noSelectionText),
            );
          }

          return Stack(
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
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.builder(
                        itemCount: selectedCategories.length,
                        itemBuilder: (context, index) {
                          final tagCategory = selectedCategories[index];
                          final tags = data.getTagsByCategory(tagCategory.tagCategoryId);

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 16, top: 16),
                                child: SquareToggleButton(
                                  height: 116,
                                  width: 116,
                                  icon: TagCategoryIcon.icon[tagCategory.tagCategoryId - 1].icon,
                                  text: tagCategory.categoryName,
                                  textStyle: EconaTextStyle.labelSmall22(
                                    color: EconaColor.grayDarkActive,
                                  ),
                                ),
                              ),
                              // タグ表示部分
                              if(tags != null)...[
                                Wrap(
                                  spacing: 10,
                                  runSpacing: 4,
                                  children: tags.map((tag) {
                                    return GestureDetector(
                                      onTap: () {
                                        ref.read(tagViewModelProvider.notifier).toggleTagSelection(tag.tagId);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: data.isTagSelected(tag.tagId) ? Colors.purple : Colors.white,
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(color: Colors.grey.shade300),
                                        ),
                                        child: Text(
                                          tag.tagName,
                                          style: EconaTextStyle.labelXSmall(
                                            color: data.isTagSelected(tag.tagId) ? Colors.white : Colors.black,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ] else...[
                                const SizedBox(
                                  height: 50,
                                  child: Center(child: EconaLoadingIndicator()),
                                ),
                              ],
                              // 最後の要素の場合は下部に余白を追加
                              if (index == selectedCategories.length - 1)
                                const SizedBox(height: 120),
                            ],
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
                    text: data.hasSelectedTags
                      ? '$buttonTextWithCount (${data.selectedTagCount}個選択中)'
                      : buttonText,
                    enabled: data.hasSelectedTags,
                    onPressed: () async {
                      try {
                        await onSave();

                        if (context.mounted) {
                          if (!isRegistrationFlow && context.mounted) {
                            await EconaNotification.showTopToast(
                              context,
                              message: 'LIKEタグを設定しました',
                              duration: const Duration(seconds: 2),
                            );
                            // 同一フレーム内で2回popするとGoRouterが二重完了するため、
                            // 1回目を即時、2回目を次フレームで実行
                            final router = GoRouter.of(context);
                            final navigator = router.routerDelegate.navigatorKey.currentState;
                            if (navigator != null && navigator.canPop()) {
                              navigator.pop();
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                final nav2 = router.routerDelegate.navigatorKey.currentState;
                                if (nav2 != null && nav2.canPop()) {
                                  nav2.pop();
                                }
                              });
                            }
                          }
                        }
                      } on Exception catch (_) {
                        if (context.mounted) {
                          await EconaNotification.showTopToast(
                            context,
                            message: '保存に失敗しました',
                            duration: const Duration(seconds: 2),
                          );
                        }
                      }
                    },
                  ),
                ),
              ),
            ],
          );
        },
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
    );
  }
}