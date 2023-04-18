import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_images.dart';
import 'app_text.dart';

class R {
  static double get dimenInfinite => double.infinity;

  static RDimen get dimen => RDimen();

  static AppColors get color => AppColors();

  static AppImages get image => AppImages();

  static AppTexts get string => AppTexts();

  static RFontWeight get fontWeight => RFontWeight();

  static void initDimen(double width, double height, double devicePixelRatio) {
    dimen.init(width, devicePixelRatio);
  }
}

class RDimen {
  static final RDimen _instance = RDimen._internal();

  factory RDimen() => _instance;

  RDimen._internal();

  double _unit = 1.0;

  void init(double width, double devicePixelRatio) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      _unit = width >= 411 ? 411 / 360 : 1.0;
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {

    }
  }

  double? operator [](double? value) {
    if (value != null) {
      return value * _unit;
    }
    return null;
  }

  double get deviceUnit => _unit;
}

class RFontWeight {
  static const RFontWeight _instance = RFontWeight._internal();

  factory RFontWeight() => _instance;

  const RFontWeight._internal();

  final FontWeight light = FontWeight.w200;

  final FontWeight fontWeight300 = FontWeight.w300;

  final FontWeight normal = FontWeight.normal;

  final FontWeight medium = FontWeight.w500;

  final FontWeight fontWeight600 = FontWeight.w600;

  final FontWeight bold = FontWeight.bold;
}

TextStyle textStyleLight(Color color, double size, {double? height}) =>
    TextStyle(
        color: color,
        fontSize: size,
        fontWeight: R.fontWeight.light,
        decoration: TextDecoration.none,
        height: height);

TextStyle textStyleLightCancelLine(Color color, double size,
        {double? height}) =>
    TextStyle(
        color: color,
        fontSize: size,
        fontWeight: R.fontWeight.light,
        decoration: TextDecoration.lineThrough,
        height: height);

TextStyle textStyle300(Color color, double size, {double? height}) => TextStyle(
    color: color,
    fontSize: size,
    fontWeight: R.fontWeight.fontWeight300,
    decoration: TextDecoration.none,
    height: height);

TextStyle textStyleNormal(Color color, double size, {double? height}) =>
    TextStyle(
        color: color,
        fontSize: size,
        fontWeight: R.fontWeight.normal,
        decoration: TextDecoration.none,
        height: height);

TextStyle textStyleMedium(Color color, double size, {double? height}) =>
    TextStyle(
        color: color,
        fontSize: size,
        fontWeight: R.fontWeight.medium,
        decoration: TextDecoration.none,
        height: height);

TextStyle textStyleMediumUnderLine(Color color, double size,
        {double? height}) =>
    TextStyle(
        color: color,
        fontSize: size,
        fontWeight: R.fontWeight.medium,
        decoration: TextDecoration.underline,
        height: height);

TextStyle textStyle600(Color color, double size, {double? height}) => TextStyle(
    color: color,
    fontSize: size,
    fontWeight: R.fontWeight.fontWeight600,
    decoration: TextDecoration.none,
    height: height);

TextStyle textStyleBold(Color color, double size, {double? height}) =>
    TextStyle(
        color: color,
        fontSize: size,
        fontWeight: R.fontWeight.bold,
        decoration: TextDecoration.none,
        height: height);

TextStyle textStyleBlackLight(double size, {double? height}) => TextStyle(
    color: R.color.black,
    fontSize: size,
    fontWeight: R.fontWeight.light,
    decoration: TextDecoration.none,
    height: height);

TextStyle textStyleBlackNormal(double size, {double? height}) => TextStyle(
    color: R.color.black,
    fontSize: size,
    fontWeight: R.fontWeight.normal,
    decoration: TextDecoration.none,
    height: height);

TextStyle textStyleBlackMedium(double size, {double? height}) => TextStyle(
    color: R.color.black,
    fontSize: size,
    fontWeight: R.fontWeight.medium,
    decoration: TextDecoration.none,
    height: height);

TextStyle textStyleBlack600(double size, {double? height}) => TextStyle(
    color: R.color.black,
    fontSize: size,
    fontWeight: R.fontWeight.fontWeight600,
    decoration: TextDecoration.none,
    height: height);

TextStyle textStyleBlackBold(double size, {double? height}) => TextStyle(
    color: R.color.black,
    fontSize: size,
    fontWeight: R.fontWeight.bold,
    decoration: TextDecoration.none,
    height: height);

TextStyle textStyleWhiteLight(double size, {double? height}) => TextStyle(
    color: R.color.white,
    fontSize: size,
    fontWeight: R.fontWeight.light,
    decoration: TextDecoration.none,
    height: height);

TextStyle textStyleWhiteNormal(double size, {double? height}) => TextStyle(
    color: R.color.white,
    fontSize: size,
    fontWeight: R.fontWeight.normal,
    decoration: TextDecoration.none,
    height: height);

TextStyle textStyleWhiteMedium(double size, {double? height}) => TextStyle(
    color: R.color.white,
    fontSize: size,
    fontWeight: R.fontWeight.medium,
    decoration: TextDecoration.none,
    height: height);

TextStyle textStyleWhite600(double size, {double? height}) => TextStyle(
    color: R.color.white,
    fontSize: size,
    fontWeight: R.fontWeight.fontWeight600,
    decoration: TextDecoration.none,
    height: height);

TextStyle textStyleWhiteBold(double size, {double? height}) => TextStyle(
    color: R.color.white,
    fontSize: size,
    fontWeight: R.fontWeight.bold,
    decoration: TextDecoration.none,
    height: height);
