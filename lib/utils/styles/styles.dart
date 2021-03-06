import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/styles/app_colors.dart';

String newYorkDefault = 'New York';
const textSize48px = 40.0;
const textSize32px = 32.0;
const textSize22px = 22.0;
const textSize16px = 16.0;
const textSize18px = 18.0;
const textSize14px = 14.0;
const textSize12px = 12.0;
const textSize10px = 10.0;

class Styles {
  //Font style Nunito
  static TextStyle? semiBold22pxTextStyle({Color color = Colors.black}) =>
      GoogleFonts.nunito(
        fontSize: textSize22px,
        fontWeight: FontWeight.w500,
        color: color,
      );

  static TextStyle? semibold14pxTextStyle({Color color = Colors.black}) => GoogleFonts.nunito(
        fontSize: textSize14px,
        fontWeight: FontWeight.w500,
        color: color,
      );

  static TextStyle? semibold22pxTextStyle({Color color = Colors.black}) => GoogleFonts.nunito(
        fontSize: textSize22px,
        fontWeight: FontWeight.w500,
        color: color,
      );

  static TextStyle? bold14pxTextStyle({Color color = Colors.black}) => GoogleFonts.nunito(
        fontSize: textSize14px,
        fontWeight: FontWeight.bold,
        color: color,
      );

  static TextStyle? bold16pxTextStyle(Color color) => GoogleFonts.nunito(
        fontSize: textSize16px,
        fontWeight: FontWeight.bold,
        color: color,
      );

  static TextStyle? bold32pxTextStyle(Color color) => GoogleFonts.nunito(
        fontSize: textSize32px,
        fontWeight: FontWeight.bold,
        color: color,
      );

  static TextStyle? bold48pxTextStyle(Color color) => GoogleFonts.nunito(
        fontSize: textSize48px,
        fontWeight: FontWeight.bold,
        color: color,
      );

  static TextStyle? semibold12pxTextStyle({Color color = Colors.black}) => GoogleFonts.nunito(
        fontSize: textSize12px,
        fontWeight: FontWeight.w500,
        color: color,
      );

  static TextStyle? regular10pxTextStyle({Color color = Colors.black}) => GoogleFonts.nunito(
        fontSize: textSize10px,
        fontWeight: FontWeight.normal,
        color: color,
      );

  static TextStyle? extraBold10pxTextStyle(Color color) => GoogleFonts.nunito(
        fontSize: textSize10px,
        fontWeight: FontWeight.w900,
        color: color,
      );

  //Font style New York
  static TextStyle? newyorkSemibold14pxTextStyle(Color color) => TextStyle(
        fontFamily: newYorkDefault,
        fontSize: textSize14px,
        fontWeight: FontWeight.w500,
        color: color,
      );

  static TextStyle? newyorkBold16pxTextStyle(Color color) => TextStyle(
        fontFamily: newYorkDefault,
        fontWeight: FontWeight.bold,
        fontSize: textSize16px,
        color: color,
      );

  static TextStyle? smallNewyork18pxTextStyle(Color color) => TextStyle(
        fontFamily: newYorkDefault,
        fontWeight: FontWeight.bold,
        fontSize: textSize18px,
        color: color,
      );
}
