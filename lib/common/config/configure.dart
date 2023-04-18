import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_app/common/config/r.dart';

Future<dynamic> configurePush(BuildContext context, WidgetBuilder builder,
    {StatusBarColor statusBarColor = StatusBarColor.light,
      PushOption? pushOption = PushOption.push,
      RoutePredicate? predicate}) async {
  FocusScope.of(context).unfocus();

  StatusBarColor? oldStatusBarColor;
  if(statusBarColor != configureStatusBarColor) {
    oldStatusBarColor = configureStatusBarColor;
    configureStatusBarColor = statusBarColor;
  }

  dynamic result;
  switch(pushOption) {
    case PushOption.replace:
      result = await Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: builder));
      break;
    case PushOption.replaceUntil:
      result = await Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: builder),
          predicate ?? (Route<dynamic> route) => false);
      break;
    default:
      result = await Navigator.push(
          context,
          MaterialPageRoute(builder: builder));
      break;
  }

  if(oldStatusBarColor != null) {
    configureStatusBarColor = oldStatusBarColor;
  }

  return result;
}

StatusBarColor _statusBarColor = StatusBarColor.light;

StatusBarColor get configureStatusBarColor => _statusBarColor;

set configureStatusBarColor(StatusBarColor color) {
  if (defaultTargetPlatform == TargetPlatform.android) {
    switch (color) {
      case StatusBarColor.dark:
        _statusBarColor = StatusBarColor.dark;
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
              statusBarColor: R.color.transparent,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light,
              systemNavigationBarColor: R.color.white,
              systemNavigationBarIconBrightness: Brightness.dark,
          ),
        );
        break;
      case StatusBarColor.light:
        _statusBarColor = StatusBarColor.light;
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: R.color.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
            systemNavigationBarColor: R.color.white,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
        );
        break;
    }
  } else if (defaultTargetPlatform == TargetPlatform.iOS) {
    switch (color) {
      case StatusBarColor.dark:
        _statusBarColor = StatusBarColor.dark;
        SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.light
        );
        break;
      case StatusBarColor.light:
        _statusBarColor = StatusBarColor.light;
        SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.dark
        );
        break;
    }
  }
}

enum StatusBarColor{
  dark,
  light
}

enum PushOption {
  push,
  replace,
  replaceUntil
}
