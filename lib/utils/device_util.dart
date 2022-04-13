
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceUtil {

  static setDarkStatusBar() => setBarStatus(true);

  static setLightStatusBar() => setBarStatus(false);

  /// 设置沉浸式状态栏
  static setBarStatus(bool isDarkIcon, {Color color = Colors.transparent}) async{
    if (Platform.isAndroid) {
      final SystemUiOverlayStyle systemUiOverlayStyle;
      if (isDarkIcon) {
        systemUiOverlayStyle = SystemUiOverlayStyle(
            statusBarColor: color, statusBarIconBrightness: Brightness.dark
        );
      } else {
        systemUiOverlayStyle = SystemUiOverlayStyle(
            statusBarColor: color, statusBarIconBrightness: Brightness.light
        );
      }
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}