import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'custom_style/theme.dart';

class AppUtils {
  static double getSizeFromSettings(int textSize) {
    return {
      0: 16.0,
      1: 20.0,
      2: 24.0,
    }[textSize] ?? 20.0;
  }

  static FontStyle getFontFromSettings(int fontType) {
    switch (fontType) {
      case 0:
        return FontStyle.normal;
      case 1:
        return FontStyle.italic;
      case 2:
        return FontStyle.normal; // lub FontStyle.italic w zależności od wybranego fontu
      default:
        return FontStyle.normal;
    }
  }

  static BoxDecoration setThemeDesign(int style) {
    switch (style) {
      case 0:
        return AppDecoration.neumorphicBackground;
      case 1 || 2 || 3:
        return AppDecoration.transparentBackground;

      default:
        return AppDecoration.neumorphicBackground;
    }
  }
}
