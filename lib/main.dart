import 'package:flutter/material.dart';
import 'package:flutter_app/page/home/home_page.dart';
import 'package:flutter_app/res/strings.dart';
import 'res/colors.dart';


void main() => runApp(MyApp());
bool bmobEnable = false;
bool _blocDebug = true;
final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor:WColors.theme_color
      ),
      routes:routes ,
      title: res.appName,
      navigatorKey: navigatorKey,
      home: HomePage(),
    );
  }

  /**
   * 路由集合
   */
  Map<String, WidgetBuilder> routes = {};
}
