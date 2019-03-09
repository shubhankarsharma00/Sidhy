import 'dart:ui';
import 'package:flutter/cupertino.dart';

class Colors {

  const Colors();
  
  static const Color primaryColor = const Color(0xFF00ffff);
  static const Color primaryColorDarker = const Color(0xFF004444);
  static const Color loginGradientStart = primaryColor;
  static const Color loginGradientEnd = primaryColorDarker;

  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const primaryGradientDark = const LinearGradient(
    colors: const [const Color(0xFF009999), const Color(0xFF004545)],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}