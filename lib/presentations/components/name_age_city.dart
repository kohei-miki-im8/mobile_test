import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';

class NameAgeCity extends StatelessWidget {
  const NameAgeCity({
    required this.name,
    required this.ageText,
    required this.cityText,
    this.textColor,
    super.key,
  });
  final String name;
  final String ageText;
  final String cityText;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          name,
          style: EconaTextStyle.headline2(
            color: textColor ?? EconaColor.grayDarkActive,
          ),
        ),
        const SizedBox(width: 6),
        AgeAndCity(
          ageText: ageText,
          cityText: cityText,
          textColor: textColor,
        ),
      ],
    );
  }
}

class AgeAndCity extends StatelessWidget {
  const AgeAndCity({
    required this.ageText,
    required this.cityText,
    this.textColor,
    super.key,
  });
  final String ageText;
  final String cityText;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          '/',
          style: EconaTextStyle.regularSmall140(
            color: EconaColor.purpleLightActive,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          ageText,
          style: EconaTextStyle.regularSmall140(
            color: textColor ?? EconaColor.grayDarkActive,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          cityText,
          style: EconaTextStyle.regularSmall140(
            color: textColor ?? EconaColor.grayDarkActive,
          ),
        ),
      ],
    );
  }
}
