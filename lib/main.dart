import 'package:flutter/material.dart';
import 'package:flutter_app/res/strings.dart';
import 'home/home_page.dart';
import 'res/colors.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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

  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  /**
   * 路由集合
   */
  Map<String, WidgetBuilder> routes = {};
}
