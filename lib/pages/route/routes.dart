import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/home_page.dart';
import 'package:flutter_application_1/pages/web_view_page.dart';

class Routes {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case RoutePath.webViewPage:
        return MaterialPageRoute(
            builder: (_) => WebViewPage(
                  title: '首页跳转而来',
                ));
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}

class RoutePath {
  static const String home = '/';
  static const String webViewPage = '/web_view_page';
}
