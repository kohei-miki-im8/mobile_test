import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    super.key,
    this.cost,
    this.unit,
    this.width,
    this.height,
  });

  final Widget icon;
  final String title;
  final String description;
  final int? cost;
  final String? unit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 20),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          width: 1,
          color: EconaColor.grayNormal,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              Expanded(
                child: Column(
                  spacing: 2,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InnerShadowText(
                          text: title,
                          textStyle: EconaTextStyle.labelMedium2140(
                            color: EconaColor.grayNormal,
                          ),
                          innerShadowTextStyles: [
                            EconaTextStyle.labelMedium2140(
                              foreground: EconaShadow().headlineInnerShadow,
                            ),
                          ],
                        ),
                        if (cost != null && unit != null) ...[
                          const Spacer(),
                          Text(
                            '消費：$cost $unit',
                            style: EconaTextStyle.labelSmall140(
                              color: EconaColor.purpleNormal,
                            ),
                          ),
                        ],
                      ],
                    ),
                    Text(
                      description,
                      style: EconaTextStyle.labelSmall120(
                        color: EconaColor.grayNormal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FeatureData {
  const FeatureData({
    required this.icon,
    required this.title,
    required this.body,
    this.cost,
    this.unit,
  });

  final Widget icon;
  final String title;
  final String body;
  final int? cost;
  final String? unit;
}
