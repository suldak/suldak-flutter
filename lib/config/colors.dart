import 'package:flutter/material.dart';

/// 앱 테마 색상
abstract class AppColors {
  /// 앱 프라이머리 색상
  static const primary = MaterialColor(
    0xFF27B1C6,
    {
      70: Color(0xFF4DBECF),
      60: Color(0xFF7ED0DD),
      50: Color(0xFFB0E3EB),
      40: Color(0xFFDFF4F7),
      30: Color(0xFFF3FBFC),
    },
  );

  /// 앱 세컨더리 색상
  static const secondary = MaterialColor(
    0xFFEE7500,
    {
      70: Color(0xFFF79100),
      60: Color(0xFFFAB245),
      50: Color(0xFFFCC87A),
      40: Color(0xFFFEDEAD),
      30: Color(0xFFFFF2DD),
    },
  );

  static const grey = MaterialColor(
    0xFF3C3C3C,
    {
      70: Color(0xFF8E8E8E),
      60: Color(0xFF8E8E8E),
      50: Color(0xFFBEBEBE),
      40: Color(0xFFE1E1E1),
      30: Color(0xFFE8E8E8),
      20: Color(0xFFF6F6F6),
    },
  );

  static const alertPrimary = Color(0xFFE45141);

  static const alertSecondary = Color(0xFFF8A8A5);

  static const alertThird = Color(0xFFFFEEF1);

  static const informationPrimary = Color(0xFF0088DA);

  static const informationSecondary = Color(0xFF7DD5FF);

  static const informationThird = Color(0xFFE1F5FF);

  static const veryLightPickColor = Color(0xFFd8d8d8);

  static const whiteGrayColor = Color(0xFFfbfbfb);

  static const paleLilacColor = Color(0xFFe9e9ea);

  static const pageDimLayerColor = Color(0x66000000);
}
