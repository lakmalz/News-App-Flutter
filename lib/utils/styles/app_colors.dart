
import 'package:flutter/material.dart';

class AppColors {
  static Color get primaryColor => dynamicColorFromString('#FF3A44');
  static Color get secondaryColor => dynamicColorFromString('#0080FF');
  static Color get tertiaryColor => dynamicColorFromString('#FFE600');
  static Color get greyColor => dynamicColorFromString('#A6A6A6');
  static Color get greyHintTextColor => dynamicColorFromString('#818181');
  static Color get borderColor => dynamicColorFromString('#F0F1FA');
  static Color get whiteColor => dynamicColorFromString('#FFFFFF');
  static Color get blackColor => dynamicColorFromString('#000000');
  static Color get brownColor => dynamicColorFromString('#2E0505');
  static Color get focusedTextColor => dynamicColorFromString('#202663');
  static Color get gradeintEndPrimary => dynamicColorFromString('#FF8086');

  static LinearGradient get buttonLinearGradient => LinearGradient(
        colors: [
          primaryColor,
          gradeintEndPrimary,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  static LinearGradient get cardOverlayLinearGradient => LinearGradient(
        colors: [
          Colors.black.withOpacity(0.5),
          Colors.transparent,
        ],
        begin: Alignment.bottomRight,
      );

  static Color dynamicColorFromString(String? color) {
    if (color != null) {
      final _light = color.replaceAll('#', '0xff');
      return Color(int.parse(_light));
    }
    return Colors.black;
  }
}