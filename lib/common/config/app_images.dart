import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore_for_file: non_constant_identifier_names
class AppImages {
  static final AppImages _instance = AppImages._internal();

  factory AppImages() => _instance;

  AppImages._internal();

  static const String _imagePath = 'assets/images/';
  static const String _iconPath = '${_imagePath}icons/';
}

class AppImage {
  final String path;

  const AppImage(this.path);

  Image image({
    Key? key,
    double? width,
    double? height,
    BoxFit fit = BoxFit.fill,
  }) {
    return Image.asset(
      path,
      key: key,
      width: width,
      height: height,
      fit: fit,
    );
  }

  Image imageSize({Key? key, double? size, BoxFit fit = BoxFit.fill}) {
    return Image.asset(
      path,
      key: key,
      width: size,
      height: size,
      fit: fit,
    );
  }

  SvgPicture svgPicture({
    Key? key,
    double? width,
    double? height,
    BoxFit fit = BoxFit.fill,
    Color? color,
  }) {
    return SvgPicture.asset(
      path,
      key: key,
      width: width,
      height: height,
      fit: fit,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
    );
  }

  SvgPicture svgPictureSize({
    Key? key,
    double? size,
    BoxFit fit = BoxFit.fill,
    Color? color,
  }) {
    return SvgPicture.asset(
      path,
      key: key,
      width: size,
      height: size,
      fit: fit,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
    );
  }
}
