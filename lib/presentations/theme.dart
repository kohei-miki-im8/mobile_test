// 共通のデザインthemeを定義します

import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';

class EconaTheme {
  static final econaThemeData = ThemeData(
    appBarTheme: econaAppBarTheme,
    primaryColor: EconaColor.background,
    scaffoldBackgroundColor: EconaColor.background,
    textTheme: econaTextTheme,
  );

  static const econaAppBarTheme = AppBarTheme(
    backgroundColor: EconaColor.background,
  );

  static final econaTextTheme = TextTheme(
    headlineLarge: EconaTextStyle.headlineLarge(
      color: EconaColor.grayGrayPurple400,
      shadows: EconaShadow.headlineShadows,
    ),
    labelMedium: EconaTextStyle.labelMedium2140(),
    labelSmall: EconaTextStyle.labelSmall140(color: EconaColor.grayDarkActive),
  );
}
