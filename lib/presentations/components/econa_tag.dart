import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';

class EconaTag extends StatelessWidget {
  const EconaTag({
    required this.tag,
    super.key,
  });

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFF8792CF),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        tag,
        style: EconaTextStyle.labelXSmall(
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}