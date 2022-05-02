import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/styles/style.dart';

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
  Color get greyHintTextColor => dynamicColorFromString('#818181');
  Color get borderColor => dynamicColorFromString('#F0F1FA');
  Color get whiteColor => dynamicColorFromString('#FFFFFF');
  Color get brownColor => dynamicColorFromString('#2E0505');
  Color get focusedTextColor => dynamicColorFromString('#202663');

  Color get gradeintStartPrimary => dynamicColorFromString('#FF3A44');
  Color get gradeintEndPrimary => dynamicColorFromString('#FF8086');

  LinearGradient get buttonLinearGradient => LinearGradient(
                colors: [
                  gradeintStartPrimary,
                  gradeintEndPrimary,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              );

  TextStyle? xxtinySizeLightText(Color color) => GoogleFonts.poppins(
        fontSize: textSize22px,
        fontWeight: FontWeight.w300,
        color: color,
      );

  TextStyle? semibold12pxTextStyle(Color color) => GoogleFonts.nunito(
        fontSize: textSize12px,
        color: color,
      );
}
