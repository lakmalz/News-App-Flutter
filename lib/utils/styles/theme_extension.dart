import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String newYorkDefault = 'New York';
const textSize22px = 22.0;
const textSize16px = 16.0;
const textSize18px = 18.0;
const textSize14px = 14.0;
const textSize12px = 12.0;
const textSize10px = 10.0;

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
  Color get blackColor => dynamicColorFromString('#000000');
  Color get brownColor => dynamicColorFromString('#2E0505');
  Color get focusedTextColor => dynamicColorFromString('#202663');

  Color get gradeintEndPrimary => dynamicColorFromString('#FF8086');

  LinearGradient get buttonLinearGradient => LinearGradient(
        colors: [
          primaryColor,
          gradeintEndPrimary,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  LinearGradient get cardOverlayLinearGradient => LinearGradient(
        colors: [
          Colors.black.withOpacity(0.7),
          Colors.transparent,
        ],
        begin: Alignment.bottomRight,
      );

  //Font style Nunito
  TextStyle? xxtinySizeLightText(Color color) => GoogleFonts.nunito(
        fontSize: textSize22px,
        fontWeight: FontWeight.w300,
        color: color,
      );

  TextStyle? semibold12pxTextStyle(Color color) => GoogleFonts.nunito(
        fontSize: textSize12px,
        fontWeight:FontWeight.w500,
        color: color,
      );

  TextStyle? regular10pxTextStyle(Color color) => GoogleFonts.nunito(
        fontSize: textSize10px,
        fontWeight: FontWeight.normal,
        color: color,
      );

  TextStyle? extraBold10pxTextStyle(Color color) => GoogleFonts.nunito(
        fontSize: textSize10px,
        fontWeight: FontWeight.w900,
        color: color,
      );

  //Font style New York
  TextStyle? newyorkBold16pxTextStyle(Color color) => TextStyle(
        fontFamily: newYorkDefault,
        fontWeight: FontWeight.bold,
        fontSize: textSize16px,
        color: color,
      );

  TextStyle? smallNewyork18pxTextStyle(Color color) => TextStyle(
        fontFamily: newYorkDefault,
        fontWeight: FontWeight.bold,
        fontSize: textSize18px,
        color: color,
      );
}
