import 'package:econa_mobile_app/domains/entities/login_status.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';

class ColorDot extends StatelessWidget {
  const ColorDot({
    required this.color,
    super.key,
  });
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class LoginStatusWidget extends StatelessWidget {
  const LoginStatusWidget({
    required this.loginStatus,
    this.textColor = Colors.white,
    super.key,
  });

  final LoginStatus loginStatus;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ColorDot(color: loginStatus.dotColor),
        const SizedBox(width: 3),
        Text(
          loginStatus.text,
          style: EconaTextStyle.regularXSmall(color: textColor),
        ),
      ],
    );
  }
}
