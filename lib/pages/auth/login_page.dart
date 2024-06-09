import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/apis/login_vm.dart';
import 'package:flutter_application_1/pages/route/RouteUtils.dart';
import 'package:flutter_application_1/pages/route/routes.dart';
import 'package:flutter_application_1/pages/tab_page.dart';
import 'package:flutter_application_1/pages/tinder/tinder_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:tinder_clone/Models/tinder_clone_icons.dart';
// import 'package:tinder_clone/Screens/PhoneNumber.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Theme.of(context).hintColor,
                    Theme.of(context).secondaryHeaderColor,
                    Theme.of(context).primaryColor
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.35, 1.0])),
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //  Icon(
                      //     // Tinder_clone.iconfinder_338_tinder_logo_4375488__1_,
                      //     // color: Colors.white,
                      //     // size: ScreenUtil().setSp(180.0),
                      //     ),
                      SizedBox(width: ScreenUtil().setWidth(10.0)),
                      Text(
                        "Kainder",
                        style: TextStyle(
                            fontSize: 50.w,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      )
                    ],
                  ))),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(ScreenUtil().setWidth(25.0)),
                    child: Column(
                      children: <Widget>[
                        Text(
                          '欢迎回来',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.w,
                          ),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(10.0)),
                        Text(
                          '点击"登录"即表示你同意了我们的条款，虽然也没有条款，但你还是得同意',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.w,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        GestureDetector(
                          onTap: () async {
                            final username = 'songsikai'; // 从界面上获取的实际用户名
                            final password = '123456'; // 从界面上获取的实际密码

                            final loginResult =
                                await LoginModel.login(username, password);
                            print('返回的数据$loginResult');
                            if (loginResult.code == 200) {
                              RouteUtils.pushAndRemoveUntil(context, TabPage());
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 30.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: (Center(
                              child: Text(
                                "登录",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.w,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          "遇到问题了？",
                        )
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
