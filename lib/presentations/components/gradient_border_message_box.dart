import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientBorderMessageBox extends StatelessWidget {
  const GradientBorderMessageBox({
    required this.text,
    this.width,
    this.height,
    this.margin,
    this.padding,
  });

  final String text;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 92,
        width: 393,
        margin: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.transparent),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              text,
              style: EconaTextStyle.simulationSystemMessages(
                color: EconaColor.grayDarkActive,
                opacity: 0.7,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ),
    );
  }
}