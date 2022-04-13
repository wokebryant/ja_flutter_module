import 'package:flutter/material.dart';

/// 按钮样式
final outlineButtonStyle = OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0)
    ),
    side: const BorderSide(
        width: 2,
        color: Colors.black,
        style: BorderStyle.solid
    ),
    minimumSize: const Size(double.infinity, 50)
);

/// 按钮文本样式
const buttonTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w600
);

/// 用户信息文本样式
TextStyle userInfoTextStyle({
  Color? color = Colors.black,
  double? fontSize,
  FontWeight? fontWeight,
}) => TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight
);