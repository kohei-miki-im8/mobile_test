// unused import removed

import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/registration_step.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/registration/v1/create_registration_step_log.pb.dart';
import 'package:econa_mobile_app/presentations/color.dart';
// unused import removed
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/pages/registration/registration_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_path.dart';
// unused import removed
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class _BaseSkipModal extends HookConsumerWidget {
  const _BaseSkipModal({
    required this.title,
    required this.nextStep,
    required this.loggingStep,
    required this.padding,
  });

  /// モーダルのタイトル
  final String title;

  /// スキップ先のステップ
  final RegistrationStep nextStep;

  /// UpdateRegistrationStepLog用のステップ
  final RegistrationStep loggingStep;

  /// パディング
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(registrationPageViewModelProvider.notifier);
    String nextStepPath = notifier.getNextRegistrationStepPath(nextStep);

    // スキップの場合はhomeではなくFinishに飛ばす
    if(nextStepPath == EconaPath.home) {
      nextStepPath = EconaPath.registrationFinish;
    }

    final currentSkipCount = _SkipCounter.skipCount;
    final isShowAllSkip = currentSkipCount >= 1;

    return Stack(
      children: [
        Positioned(
          right: 8,
          top: 8,
          child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.close,
              color: EconaColor.grayNormal,
              size: 24,
            ),
          ),
        ),
        Container(
          width: 284,
          padding: const EdgeInsets.fromLTRB(24, 64, 24, 36),
          child: Column(
            spacing: 12,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: EconaTextStyle.headlineHeadline2(
                  color: EconaColor.grayDarkActive,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64),
                child: EconaGradientButton(
                  text: '戻る',
                  onPressed: () async {
                    context.pop();
                  },
                ),
              ),
              // スキップボタン
              TextButton(
                onPressed: () async {
                  // スキップ回数を増加
                  _SkipCounter.increment();

                  final router = GoRouter.of(context);

                  // 登録ステップログを作成
                  await notifier.createRegistrationStepLog(
                    CreateRegistrationStepLogRequest(
                      registrationStep: loggingStep,
                    ),
                  );

                  if(!context.mounted) return;

                  context.pop();
                  router.go(nextStepPath);
                },
                child: Text(
                  'スキップする',
                  style: EconaTextStyle.labelMedium1140(
                    color: EconaColor.grayNormal,
                  ),
                ),
              ),
              // スキップ回数に基づいて動的に表示
              if(isShowAllSkip)...[
                TextButton(
                  onPressed: () async {
                    context.pop();
                    await AllSkipModal.show(context);
                  },
                  child: Text(
                    'プロフィールの登録を\nすべてスキップする',
                    style: EconaTextStyle.labelMedium1140(
                      color: EconaColor.grayNormal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class PhotoSkipModal extends StatelessWidget {
  const PhotoSkipModal({super.key});

  /// アニメーション付きでモーダルを表示
  static Future<void> show(BuildContext context) async {
    await showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: const PhotoSkipModal(),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: Tween<double>(
            begin: 0.8,
            end: 1,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutBack,
          )),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const _BaseSkipModal(
      title: '写真の登録を\nスキップしますか？',
      nextStep: RegistrationStep.REGISTRATION_STEP_3_01,
      loggingStep: RegistrationStep.REGISTRATION_STEP_2_01,
      padding: EdgeInsets.only(top: 12, bottom: 48),
    );
  }
}

class SubProfileSkipModal extends StatelessWidget {
  const SubProfileSkipModal({super.key});

  /// アニメーション付きでモーダルを表示
  static Future<void> show(BuildContext context) async {
    await showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: const SubProfileSkipModal(),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: Tween<double>(
            begin: 0.8,
            end: 1,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutBack,
          )),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const _BaseSkipModal(
      title: 'その他のプロフィールの登録をスキップしますか？',
      nextStep: RegistrationStep.REGISTRATION_STEP_4_01,
      loggingStep: RegistrationStep.REGISTRATION_STEP_3_10,
      padding: EdgeInsets.only(top: 12, bottom: 48),
    );
  }
}

class TagSkipModal extends StatelessWidget {
  const TagSkipModal({super.key,});

  /// アニメーション付きでモーダルを表示
  static Future<void> show(BuildContext context) async {
    await showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: const TagSkipModal(),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: Tween<double>(
            begin: 0.8,
            end: 1,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutBack,
          )),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const _BaseSkipModal(
      title: 'タグの登録を\nスキップしますか？',
      nextStep: RegistrationStep.REGISTRATION_STEP_5_01,
      loggingStep: RegistrationStep.REGISTRATION_STEP_4_01,
      padding: EdgeInsets.only(top: 12, bottom: 48),
    );
  }
}

class CounselingSkipModal extends StatelessWidget {
  const CounselingSkipModal({super.key,});

  /// アニメーション付きでモーダルを表示
  static Future<void> show(BuildContext context) async {
    await showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: const CounselingSkipModal(),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: Tween<double>(
            begin: 0.8,
            end: 1.0,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutBack,
          )),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const _BaseSkipModal(
      title: 'AIカウンセリングを\nスキップしますか？',
      nextStep: RegistrationStep.REGISTRATION_STEP_5_02,
      loggingStep: RegistrationStep.REGISTRATION_STEP_5_01,
      padding: EdgeInsets.only(top: 12, bottom: 48),
    );
  }
}

class AllSkipModal extends HookConsumerWidget {
  const AllSkipModal({super.key});

  /// アニメーション付きでモーダルを表示
  static Future<void> show(BuildContext context) async {
    await showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: const AllSkipModal(),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: Tween<double>(
            begin: 0.8,
            end: 1.0,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutBack,
          )),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Positioned(
          right: 4,
          top: 4,
          child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.close,
              color: EconaColor.grayNormal,
              size: 24,
            ),
          ),
        ),
        Container(
          width: 284,
          padding: const EdgeInsets.fromLTRB(24, 48, 24, 48),
          child: Column(
            spacing: 12,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'すべてスキップすると、\nこの画面には戻れませんが\nよろしいですか？',
                style: EconaTextStyle.headlineHeadline2(
                  color: EconaColor.grayDarkActive,
                ),
                textAlign: TextAlign.center,
              ),
              EconaGradientButton(
                text: 'プロフィールの登録に戻る',
                onPressed: () async {
                  context.pop();
                },
              ),
              // スキップボタン
              TextButton(
                onPressed: () async {
                  // 通常のスキップ時にカウントを増やす
                  _SkipCounter.increment();

                  final router = GoRouter.of(context);

                  // 登録ステップログを作成
                  await ref.read(registrationPageViewModelProvider.notifier).createRegistrationStepLog(
                    CreateRegistrationStepLogRequest(
                      registrationStep: RegistrationStep.REGISTRATION_STEP_5_02,
                    ),
                  );

                  if(!context.mounted) return;

                  context.pop();
                  router.go(EconaPath.registrationFinish);
                },
                child: Text(
                  'すべてスキップする',
                  style: EconaTextStyle.labelMedium1140(
                    color: EconaColor.grayNormal,
                  ),
                ),
              ),
              Text(
                '※プロフィールの登録はプロフィール編集画面から、のちほど編集できます',
                style: EconaTextStyle.regularSmall140(
                  color: EconaColor.gray800,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SkipCounter {
  static int _skipCount = 0;

  static int get skipCount => _skipCount;

  static void increment() {
    _skipCount++;
  }
}