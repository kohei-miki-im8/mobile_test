import 'package:flutter/material.dart';

class EconaGradient {
  static final inputFieldBorderGradient = [
    const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFD6E3F3),
        Color(0xFFFFFFFF),
      ],
    ),
    const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFFFFFFF),
        Color(0xFFFFFFFF),
      ],
      stops: [0, 1]
    ),
  ];

  static const buttonDisabledGradient = LinearGradient(
    begin: Alignment(-1, -1.8),
    end: Alignment(1, 1),
    colors: [
      Color(0xFFDADDF0),
      Color(0xFFDADDF0),
    ],
  );

  static const defaultButtonGradient = LinearGradient(
    begin: Alignment(-1, -1.8),
    end: Alignment(1, 1),
    colors: [
      Color(0xFFD097DB),
      Color(0xFF8887EE),
    ],
  );

  static const convexPanelLinerGradients = [
    LinearGradient(
      colors: [Color(0xFFD6E3F3), Color(0xFFFFFFFF)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0, 1],
    ),
    LinearGradient(
      colors: [Color(0xFFFFFFFF), Color(0x00FFFFFF)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0, 1],
    ),
  ];

  static const List<LinearGradient> concavePanelLinerGradients = [];
}