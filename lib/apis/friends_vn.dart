import 'package:dio/dio.dart';
import 'package:flutter_application_1/datas/check_friends/check_friends.dart';
import 'package:flutter_application_1/datas/friends/friends.dart';
import 'package:flutter_application_1/datas/login/data.dart';
import 'package:flutter_application_1/datas/login/login.dart';
import 'package:flutter_application_1/datas/not_yet_friends/not_yet_friends.dart';
import 'package:flutter_application_1/http/dio_instance.dart';

class FriendsModel {
  static Future<dynamic> add_friend(
    String receiverId,
  ) async {
    // 准备登录请求的参数，这里假设使用POST方法，并且服务器期望的数据格式为json
    Map<String, dynamic> data = {
      "receiverId": receiverId,
    };

    Response response = await DioInstance.instance()
        .post(path: "/friend/add_friend", data: data);

    Friends responseData = Friends.fromJson(response.data);
    if (responseData != null) {
      return responseData.data;
    }
  }

  static Future<dynamic> get_not_yet_friend() async {
    // 准备登录请求的参数，这里假设使用POST方法，并且服务器期望的数据格式为json

    Response response =
        await DioInstance.instance().post(path: "/friend/get_not_yet_friend");

    NotYetFriends responseData = NotYetFriends.fromJson(response.data);
    if (responseData != null) {
      return responseData.data;
    }
  }

  static Future<dynamic> confirm_friend(receiverId) async {
    // 准备登录请求的参数，这里假设使用POST方法，并且服务器期望的数据格式为json

    Response response =
        await DioInstance.instance().put(path: "/friend/$receiverId/confirm");

    CheckFriends responseData = CheckFriends.fromJson(response.data);
    if (responseData != null) {
      return responseData.data;
    }
  }
}
