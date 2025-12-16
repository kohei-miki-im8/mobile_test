import 'dart:ui';

import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_modal.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_container.dart';
import 'package:econa_mobile_app/presentations/components/shadow_container.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/subscription_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    required this.message,
    required this.isMe,
    this.isVerified = false,
    this.isLocked = false,
    super.key,
  });

  final String message;
  final bool isMe;
  final bool isVerified;
  final bool isLocked;

  @override
  Widget build(BuildContext context) {
    return isMe
        ? MyChatBubble(text: message)
        : PartnerChatBubble(text: message, isLocked: isLocked);
  }
}

class MyChatBubble extends StatelessWidget {
  const MyChatBubble({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 272,
      ),
      child: ShadowContainer (
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(4),
        ),
        backgroundColor: const Color(0xFFF0F3FF),
        innerShadows: [
          BoxShadow(
            color: const Color(0xFFFFFFFF).withValues(alpha: 0.88),
            blurRadius: 9,
            offset: const Offset(-4, -4),
          ),
          const BoxShadow(
            color: Color(0xFFC1D5EE),
            blurRadius: 14,
            offset: Offset(4, 4),
          ),
        ],
        dropShadows: [
          const BoxShadow(
            color: Color(0xFFFFFFFF),
            blurRadius: 20,
            offset: Offset(-4, -4),
          ),
          BoxShadow(
            color: const Color(0xFF587CA7).withValues(alpha: 0.31),
            blurRadius: 22,
            offset: const Offset(6, 6),
          ),
        ],
        child :Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            text,
            style: EconaTextStyle.regularMedium160(
              color: EconaColor.grayTextTabEnable,
            ),
          ),
        ),
      ),
    );
  }
}

class PartnerChatBubble extends StatelessWidget {
  const PartnerChatBubble({
    required this.text,
    this.isLocked = false,
    super.key,
  });

  final String text;
  final bool isLocked;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 272,
      ),
      child:ShadowAndGradientBorderContainer(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        borderWidth: 0.5,
        gradients: [
          LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFFFFFFF).withValues(alpha: 1),
              const Color(0xFFFFFFFF).withValues(alpha: 0),
            ], stops: const [0, 1],
          ),
          const LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFFD6E3F3),
              Color(0xFFFFFFFF),
            ], stops: [0, 1],
          ),
        ],
        backgroundColor: const Color(0xFFF3F5FD),
        innerShadows: [],
        dropShadows: [
          const BoxShadow(
            color: Color(0xFFFFFFFF),
            blurRadius: 5,
            offset: Offset(-3, -3),
          ),
          BoxShadow(
            color: const Color(0xFF587CA7).withValues(alpha: 0.7),
            blurRadius: 3,
            offset: const Offset(1, 1),
          ),
          BoxShadow(
            color: const Color(0xFFE8EDFF).withValues(alpha: 0.8),
            blurRadius: 14,
            offset: const Offset(2, 2),
          ),
        ],
        child: isLocked
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: EconaGradientButton(
                  text: 'メッセージを見る',
                  onPressed: () async {
                    await showDialog<void>(
                      context: context,
                      builder: (dialogContext) => Dialog(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        insetPadding: const EdgeInsets.symmetric(horizontal: 12),
                        child: EconaModal(
                          message: '本人確認と\n有料プラン登録から！',
                          subMessage: 'メッセージの確認や送信には、本人確認および有料プランへの登録が必要です',
                          buttonText: '詳細を見てみる',
                          onButtonPressed: () async {
                            dialogContext.pop();
                            await const SubscriptionRouteData(
                              type: SubscriptionPageType.basic,
                            ).push<void>(context);
                          },
                        ),
                      ),
                    );
                  },
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  text,
                  style: EconaTextStyle.regularMedium160(
                    color: EconaColor.grayTextTabEnable,
                  ),
                ),
              ),
      ),
    );
  }
}
