import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ja_flutter_module/ui/style.dart';

import 'color.dart';

typedef TitleTapListener = Function();

/// 标题栏
Widget wbPageTitle({
  required String title,
  required TitleTapListener listener
}) {
  return Column(
    children: [
      ListTile(
        leading: const Icon(Icons.arrow_back_sharp),
        iconColor: Colors.black,
        title: Text(
            title,
            style: userInfoTextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
            )
        ),
        onTap: listener,
      ),
    Container(
      width: window.physicalSize.width,
      height: 1,
      color: lineGray,
      )
    ],
  );


}

