import 'package:flutter/material.dart';
import 'package:flutter_application_1/http/dio_instance.dart';
import 'package:flutter_application_1/pages/home/home_page.dart';
import 'package:flutter_application_1/pages/route/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  DioInstance.instance().initDio(baseUrl: "https://www.wanandroid.com");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Colors.white; // 示例背景颜色，您可以替换成需要的颜色
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(
                fontSizeFactor: 1.0, // 或者直接使用1，这里保持默认大小不变
                bodyColor: Colors.black, // 改变正文文本颜色为红色
                displayColor:
                    Colors.blue, // 改变标题或显示文本颜色为蓝色，具体影响哪些文本取决于Typography的定义
              ),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                // 自定义AppBar样式
                color: Colors.white, // 设置AppBar的背景颜色，这里使用灰色作为示例
              )),
          onGenerateRoute: Routes.generatedRoute,
          initialRoute: RoutePath.home,
          home: const HomePage(),
        );
      },
    );
  }
}
