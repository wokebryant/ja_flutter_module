import 'package:flutter/material.dart';
import 'package:ja_flutter_module/WBPersonalPage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const initRoute = "ja_init_route";

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
  "ja_init_route": (context) => const WBPersonalPage(),
};


