import 'package:flutter/foundation.dart';

// ignore_for_file: avoid_print
class Log {
  static i(String msg, {bool printTime = false}) {
    if(!kReleaseMode) _printMsg(msg, printTime);
  }

  static w(String msg, {bool printTime = false}) {
    if(!kReleaseMode) _printMsg(msg, printTime);
  }

  static e(String msg, {bool printTime = false}) {
    _printMsg(msg, printTime);
  }

  static _printMsg(String msg, bool printTime) {
    if(printTime) {
      print('${_time()} : $msg');
    } else {
      print(msg);
    }
  }

  static String _time(){
    return DateTime.now().toString();
  }
}
