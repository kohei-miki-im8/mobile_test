import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_checkbox.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EconaModal extends StatelessWidget {
  const EconaModal({
    required this.message,
    required this.buttonText,
    required this.onButtonPressed,
    this.subMessage,
    this.messageStyle,
    this.subMessageStyle,
    this.cancelText,
    this.doNotShowAgainKey,
    super.key,
  });
  final String message;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final String? subMessage;
  final TextStyle? messageStyle;
  final TextStyle? subMessageStyle;
  final String? cancelText;
  final String? doNotShowAgainKey;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth = constraints.maxWidth - 48; // 24px マージン×2
        final double cardWidth = maxWidth < 296 ? maxWidth : 296;
        return Center(
          child: Material(
            color: Colors.transparent,
            child: SafeArea(
              bottom: true,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: bottomInset),
                child: ShadowAndGradientBorderContainer(
                  borderRadius: BorderRadius.circular(20),
                  borderWidth: 1,
                  gradients: const [
                    LinearGradient(
                      colors: [Color(0xFFD6E3F3), Color(0xFFFFFFFF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ],
                  backgroundColor: const Color(0xFFF6FBFE),
                  innerShadows: EconaShadow.modalInnerShadows,
                  dropShadows: EconaShadow.modalDropShadows,
                  child: Stack(
                    children: [
                      Container(
                        width: cardWidth,
                        padding: const EdgeInsets.fromLTRB(32, 64, 32, 48),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _MessageText(text: message, messageStyle: messageStyle),
                            if(subMessage != null)...[
                              const SizedBox(height: 24),
                              _SubMessageText(text: subMessage!, messageStyle: subMessageStyle),
                            ],
                            const SizedBox(height: 24),
                            EconaGradientButton(
                              text: buttonText,
                              onPressed: onButtonPressed,
                            ),
                            _CancelButton(text: cancelText),
                            _DoNotShowAgainCheckbox(
                              doNotShowAgainKey: doNotShowAgainKey,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: IconButton(
                          icon: Assets.images.icons.close.image(
                            width: 24,
                            height: 24,
                          ),
                          iconSize: 40,
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            context.pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _MessageText extends StatelessWidget {
  const _MessageText({
    required this.text,
    this.messageStyle,
  });

  final String text;
  final TextStyle? messageStyle;

  @override
  Widget build(BuildContext context) {
    final style = messageStyle ?? EconaTextStyle.headlineHeadline2(color: EconaColor.grayDarkActive);
    return Text(
      text,
      style: style,
      textAlign: TextAlign.center,
      softWrap: true,
    );
  }
}

class _SubMessageText extends StatelessWidget {
  const _SubMessageText({
    required this.text,
    this.messageStyle,
  });

  final String text;
  final TextStyle? messageStyle;

  @override
  Widget build(BuildContext context) {
    final style = messageStyle ?? EconaTextStyle.regularMedium2160(color: EconaColor.grayDarkActive);
    return Text(
      text,
      style: style,
      textAlign: TextAlign.center,
      softWrap: true,
    );
  }
}

class _CancelButton extends StatelessWidget {
  const _CancelButton({
    required this.text,
    super.key,
  });

  final String? text;

  @override
  Widget build(BuildContext context) {
    if(text == null) {
      return const SizedBox.shrink();
    }
    return TextButton(
      onPressed: () {
        context.pop();
      },
      child: Text(
        text!,
        style: EconaTextStyle.labelMedium1140(
          color: EconaColor.grayNormal,
        ),
      ),
    );
  }
}

class _DoNotShowAgainCheckbox extends HookConsumerWidget {
  const _DoNotShowAgainCheckbox({
    required this.doNotShowAgainKey,
  });

  final String? doNotShowAgainKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isChecked = useState(false);

    if(doNotShowAgainKey == null) {
      return const SizedBox.shrink();
    }

    return EconaCheckbox(
      value: isChecked.value,
      onChanged: (value) async {
        isChecked.value = value;
        if(value){
          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool(doNotShowAgainKey!, true);
        }
      },
      text: '今後表示しない',
      textStyle: EconaTextStyle.labelMedium1140(
        color: EconaColor.grayNormal,
      ),
    );
  }
}
