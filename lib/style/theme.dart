import 'dart:ui';
import 'package:flutter/cupertino.dart';

class Colors {

  const Colors();
  
  static const Color lightColor = const Color(0xFFfeffff);
  static const Color darkColor = const Color(0xFF17252a);
  static const Color accentColor = const Color(0xFF3aafa9);
  static const Color primaryColor = accentColor;
  static const Color primaryColorDarker = const Color(0xFF2b7a7b);
  static const Color loginGradientStart = primaryColorDarker;
  static const Color loginGradientEnd = darkColor;

  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const primaryGradientDark = const LinearGradient(
    colors: const [primaryColorDarker, darkColor],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}