import 'package:flutter/material.dart';
import 'package:flutter_application_1/apis/login_vm.dart';
import 'package:flutter_application_1/datas/siteup/data.dart';
import 'package:flutter_application_1/pages/route/RouteUtils.dart';
import 'package:flutter_application_1/pages/tab_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:html';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<RegisterPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  late String _username, _password, _repassword;
  bool _isObscure = true;
  Color _eyeColor = Colors.grey;

  Future<void> _saveToken(String? token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token ?? '');
    print('Token saved successfully');
  }

  bool cameraAccess = false;
  String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: kToolbarHeight), // 距离顶部一个工具栏的高度
            buildTitle(), // Login
            buildTitleLine(), // 标题下面的下滑线
            const SizedBox(height: 50),
            buildEmailTextField(), // 输入邮箱
            const SizedBox(height: 15),
            buildPasswordTextField(context, '密码', (v) => _password = v), // 输入密码
            const SizedBox(height: 15),
            buildPasswordTextField(
                context, '确认密码', (v) => _repassword = v), // 再次输入密码
            // buildForgetPasswordText(context), // 忘记密码
            const SizedBox(height: 15),

            const SizedBox(height: 50),
            buildLoginButton(context), // 登录按钮
            const SizedBox(height: 30),
            // buildRegisterText(context), // 注册
          ],
        ),
      ),
    );
  }

  Widget buildRegisterText(context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('没有账号?'),
            GestureDetector(
              child: const Text('点击注册', style: TextStyle(color: Colors.green)),
              onTap: () {
                print("点击注册");
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildOtherLoginText() {
    return const Center(
      child: Text(
        '其他账号登录',
        style: TextStyle(color: Colors.grey, fontSize: 14),
      ),
    );
  }

  Widget buildLoginButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 45,
        width: 270,
        child: ElevatedButton(
          style: ButtonStyle(
              // 设置圆角
              shape: MaterialStateProperty.all(const StadiumBorder(
                  side: BorderSide(style: BorderStyle.none)))),
          child: Text(
            '注册',
            style: TextStyle(fontSize: 32, color: Colors.black),
          ),
          onPressed: () async {
            // 表单校验通过才会继续执行
            if ((_formKey.currentState as FormState).validate()) {
              (_formKey.currentState as FormState).save();
              if (_username != null && _password != null) {
                Data loginResult =
                    await LoginModel.signup(_username, _password, _repassword);
                await _saveToken(loginResult.token);
                if (loginResult != null) {
                  await _saveToken(loginResult.token);
                  RouteUtils.pushAndRemoveUntil(context, TabPage());
                }
              }
            }
          },
        ),
      ),
    );
  }

  Widget buildForgetPasswordText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
            // Navigator.pop(context);
            print("忘记密码");
          },
          child: const Text("忘记密码？",
              style: TextStyle(fontSize: 14, color: Colors.grey)),
        ),
      ),
    );
  }

  Widget buildPasswordTextField(BuildContext context, text, onPasswordChanged) {
    return TextFormField(
        obscureText: false, // 是否显示文字
        onSaved: (v) {
          if (v != null) {
            onPasswordChanged(v);
          }
        },
        validator: (v) {
          if (v!.isEmpty) {
            return '请输入密码';
          }
        },
        decoration: InputDecoration(
            labelText: text,
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _eyeColor,
              ),
              onPressed: () {
                // 修改 state 内部变量, 且需要界面内容更新, 需要使用 setState()
                setState(() {
                  _isObscure = !_isObscure;
                  _eyeColor = (_isObscure
                      ? Colors.grey
                      : Theme.of(context).iconTheme.color)!;
                });
              },
            )));
  }

  Widget buildEmailTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: '用户名'),
      onSaved: (v) => _username = v!,
    );
  }

  Widget buildTitleLine() {
    return Padding(
        padding: const EdgeInsets.only(left: 12.0, top: 4.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            color: Colors.black,
            width: 40,
            height: 2,
          ),
        ));
  }

  Widget buildTitle() {
    return const Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          '注册',
          style: TextStyle(fontSize: 42, color: Colors.black),
        ));
  }

  Widget buildCamera(context) {
    return const Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          '注册',
          style: TextStyle(fontSize: 42, color: Colors.black),
        ));
  }
}
