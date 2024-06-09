import 'package:dio/dio.dart';
import 'package:flutter_application_1/datas/login/data.dart';
import 'package:flutter_application_1/datas/login/login.dart';
import 'package:flutter_application_1/http/dio_instance.dart';

class LoginModel {
  static Future<dynamic> login(String username, String password) async {
    // 准备登录请求的参数，这里假设使用POST方法，并且服务器期望的数据格式为json
    Map<String, dynamic> data = {
      "username": username,
      "password": password,
    };

    Response response =
        await DioInstance.instance().post(path: "/auth/login", data: data);

    Login responseData = Login.fromJson(response.data);
    if (responseData != null) {
      return responseData.data;
    }
  }
}
