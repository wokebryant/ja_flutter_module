import 'package:flutter/material.dart';
import 'package:ja_flutter_module/page/wb_personal_page.dart';
import 'package:ja_flutter_module/page/wb_record_page.dart';

/// 原生管理管理Route及Native通信
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const initRoute = "wb_personal_page";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: initRoute,
      routes: routeMap,
    );
  }
}

Map<String, WidgetBuilder> routeMap = {
  "wb_personal_page": (context) => const WBPersonalPage(),
  "wb_record_page": (context) => const WBWorkRecordPage(),
};


