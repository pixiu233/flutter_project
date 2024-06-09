import 'package:dio/dio.dart';
import 'package:flutter_application_1/datas/tinder_users/datum.dart';
import 'package:flutter_application_1/datas/tinder_users/tinder_users.dart';
import 'package:flutter_application_1/http/dio_instance.dart';

class TinderUsersModel {
  static Future<List<Datum>?> getTinderUsers() async {
    try {
      Response responese = await DioInstance.instance().get(path: "/auth/list");

      TinderUsers tinderUserData = TinderUsers.fromJson(responese.data);

      if (tinderUserData != null) {
        return tinderUserData.data;
      }
      return [];
    } catch (e) {
      print('Error fetching : $e');
    }
  }
}
