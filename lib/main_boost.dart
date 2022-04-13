import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:ja_flutter_module/page/wb_personal_page.dart';
import 'package:ja_flutter_module/page/wb_record_page.dart';

/// 闲鱼FlutterBoost管理Route及Native通信
void main() {
  CustomFlutterBinding();
  PageVisibilityBinding.instance.addGlobalObserver(AppLifecycleObserver());
  runApp(const MyApp());
}

/// 控制Boost状态的resume和pause
class CustomFlutterBinding extends WidgetsFlutterBinding
    with BoostFlutterBinding {}

/// 全局生命周期监听
class AppLifecycleObserver with GlobalPageVisibilityObserver {
  @override
  void onBackground(Route route) {
    super.onBackground(route);
    print("AppLifecycleObserver - onBackground");
  }

  @override
  void onForeground(Route route) {
    super.onForeground(route);
    print("AppLifecycleObserver - onForground");
  }

  @override
  void onPagePush(Route route) {
    super.onPagePush(route);
    print("AppLifecycleObserver - onPagePush");
  }

  @override
  void onPagePop(Route route) {
    super.onPagePop(route);
    print("AppLifecycleObserver - onPagePop");
  }

  @override
  void onPageHide(Route route) {
    super.onPageHide(route);
    print("AppLifecycleObserver - onPageHide");
  }

  @override
  void onPageShow(Route route) {
    super.onPageShow(route);
    print("AppLifecycleObserver - onPageShow");
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  /// 路由管理
  static Map<String, FlutterBoostRouteFactory> routerMap = {
    'wb_personal_page': (settings, uniqueId) {
      return CupertinoPageRoute<dynamic>(
          settings: settings,
          builder: (_) => const WBPersonalPage()
      );
    },
    'wb_record_page': (settings, uniqueId) {
      return CupertinoPageRoute<dynamic>(
          settings: settings,
          builder: (_) => const WBWorkRecordPage()
      );
    },
  };

  Route<dynamic>? routeFactory(RouteSettings settings, String? uniqueId) {
    FlutterBoostRouteFactory? func = routerMap[settings.name];
    if (func == null) {
      return null;
    }
    return func(settings, uniqueId);
  }

  Widget appBuilder(Widget home) {
    return MaterialApp(
      home: home,
      debugShowCheckedModeBanner: true,
      ///必须加上builder参数，否则showDialog等会出问题
      builder: (_, __) {
        return home;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return FlutterBoostApp(
      routeFactory,
      appBuilder: appBuilder,
      initialRoute: "wb_personal_page",
    );
  }
}
