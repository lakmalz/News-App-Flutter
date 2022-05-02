import 'package:flutter/material.dart';

extension StyleThemeContext on BuildContext {
  Color dynamicColorFromString(String? color) {
    if (color != null) {
      final _light = color.replaceAll('#', '0xff');
      return Color(int.parse(_light));
    }
    return Colors.black;
  }

  Color get primaryColor => dynamicColorFromString('#FF3A44');
  Color get secondaryColor => dynamicColorFromString('#0080FF');
  Color get tertiaryColor => dynamicColorFromString('#FFE600');
  Color get greyColor => dynamicColorFromString('#A6A6A6');
  Color get whiteColor => dynamicColorFromString('#FFFFFF');
  Color get brownColor => dynamicColorFromString('#2E0505');

  Color get gradeintStartPrimary => dynamicColorFromString('#FF3A44');
  Color get gradeintEndPrimary => dynamicColorFromString('#FF8086');
}
