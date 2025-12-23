import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_list_tile.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/pages/registration/next_button.dart';
import 'package:econa_mobile_app/presentations/pages/registration/registration_skip_modal.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// プロフィール編集フォームの共通コンポーネント
class ProfileEditFormComponent<T> extends HookConsumerWidget {
  const ProfileEditFormComponent({
    required this.title,
    required this.items,
    required this.selectedValue,
    required this.onValueChanged,
    required this.onSubmit,
    required this.itemBuilder,
    this.showSkipButton = true,
    this.skipModalWidget,
    super.key,
  });

  /// ページタイトル
  final String title;
  
  /// 選択肢のリスト
  final List<T> items;
  
  /// 現在選択されている値のインデックス
  final int? selectedValue;
  
  /// 値変更時のコールバック
  final void Function(int index) onValueChanged;
  
  /// 送信時のコールバック
  final Future<void> Function() onSubmit;
  
  /// アイテム表示用のビルダー
  final String Function(T item) itemBuilder;
  
  /// スキップボタンの表示フラグ
  final bool showSkipButton;
  
  /// スキップモーダルのウィジェット
  final Widget? skipModalWidget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CenterAppBar(
        titleText: title,
        backgroundColor: const Color(0xFFF0EFFD),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Assets.images.icons.back.image  (height: 32, width: 36),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        actions: showSkipButton ? [
          TextButton(
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (context) => Dialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: skipModalWidget ?? const SubProfileSkipModal(),
                ),
              );
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
        ] : null,
      ),
      backgroundColor: const Color(0xFFF0EFFD),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: SelectionListTile<T>(
                items: items,
                selectedIndex: selectedValue,
                onItemSelected: onValueChanged,
                itemBuilder: itemBuilder,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.all(40),
                child: CircleNextButton(
                  onTap: onSubmit,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// テキスト入力用のプロフィール編集フォームコンポーネント
class ProfileEditTextFormComponent extends HookConsumerWidget {
  const ProfileEditTextFormComponent({
    required this.title,
    required this.controller,
    required this.onSubmit,
    this.hintText,
    this.maxLines = 1,
    this.showSkipButton = true,
    this.skipModalWidget,
    super.key,
  });
  
  /// ページタイトル
  final String title;
  
  /// テキストコントローラー
  final TextEditingController controller;
  
  /// 送信時のコールバック
  final Future<void> Function() onSubmit;
  
  /// ヒントテキスト
  final String? hintText;
  
  /// 最大行数
  final int maxLines;
  
  /// スキップボタンの表示フラグ
  final bool showSkipButton;
  
  /// スキップモーダルのウィジェット
  final Widget? skipModalWidget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CenterAppBar(
        titleText: title,
        backgroundColor: const Color(0xFFF0EFFD),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Assets.images.icons.back.image(height: 32, width: 36),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        actions: showSkipButton ? [
          TextButton(
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (context) => Dialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: skipModalWidget ?? const SubProfileSkipModal(),
                ),
              );
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
        ] : null,
      ),
      backgroundColor: const Color(0xFFF0EFFD),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                maxLines: maxLines,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.all(40),
                child: CircleNextButton(
                  onTap: onSubmit,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 