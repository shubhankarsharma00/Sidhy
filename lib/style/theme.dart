import 'dart:ui';
import 'package:flutter/cupertino.dart';

class Colors {

  const Colors();
  
  static const Color lightColor = const Color(0xFFE0D6B1);
  static const Color darkColor = const Color(0xFF726060);
  static const Color accentColor = const Color(0xFFF26359);
  static const Color primaryColor = const Color(0xFFF6F5AE);
  static const Color primaryColorDarker = const Color(0xFFFFD749);
  static const Color loginGradientStart = primaryColor;
  static const Color loginGradientEnd = accentColor;

  // static const Color lightColor = const Color(0xFFc2eabd);
  // static const Color darkColor = const Color(0xFF050517);
  // static const Color accentColor = const Color(0xFFcf5c36);
  // static const Color primaryColor = const Color(0xFFc0babc);
  // static const Color primaryColorDarker = const Color(0xFFefc88b);
  // static const Color loginGradientStart = primaryColor;
  // static const Color loginGradientEnd = accentColor;

  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const primaryGradientDark = const LinearGradient(
    colors: const [primaryColor, primaryColor],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}