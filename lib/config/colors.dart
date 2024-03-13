import 'package:flutter/material.dart';

/// 앱 테마 색상
abstract class AppColors {
  /// 앱 프라이머리 색상
  static const primary = MaterialColor(
    0xFF08BECA,
    {
      900: Color(0xFF022628),
      800: Color(0xFF034C51),
      700: Color(0xFF057279),
      600: Color(0xFF0698A2),
      500: Color(0xFF08BECA),
      400: Color(0xFF39CBD5),
      300: Color(0xFF6BD8DF),
      200: Color(0xFF9CE5EA),
      100: Color(0xFFCEF2F4),
      50: Color(0xFFF6FDFE),
    },
  );

  /// 앱 세컨더리 오랜지 색상
  static const secondaryOrange = MaterialColor(
    0xFFFF9300,
    {
      700: Color(0xFF995800),
      500: Color(0xFFFF9300),
      300: Color(0xFFFFBE66),
      100: Color(0xFFFFE9CC),
      50: Color(0xFFFFF5E5),
    },
  );

  /// 앱 세컨더리 그린 색상
  static const secondaryGreen = MaterialColor(
    0xFF20BF27,
    {
      700: Color(0xFF137317),
      500: Color(0xFF20BF27),
      300: Color(0xFF79D97D),
      100: Color(0xFFDEF8DF),
      50: Color(0xFFF0FEF1),
    },
  );

  static const grey = MaterialColor(
    0xFF3C3C3C,
    {
      900: Color(0xFF1E1E1E),
      800: Color(0xFF3C3C3C),
      700: Color(0xFF646464),
      600: Color(0xFF8E8E8E),
      500: Color(0xFFBEBEBE),
      400: Color(0xFFE1E1E1),
      300: Color(0xFFE8E8E8),
      200: Color(0xFFF6F6F6),
    },
  );

  /// 앱 경고/에러 색상
  static const alertError = MaterialColor(
    0xFFE45141,
    {
      700: Color(0xFF893127),
      500: Color(0xFFE45141),
      300: Color(0xFFEF978D),
      100: Color(0xFFFADCD9),
      50: Color(0xFFFFF2F1),
    },
  );
}
