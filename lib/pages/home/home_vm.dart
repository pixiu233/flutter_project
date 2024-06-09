import 'package:dio/dio.dart';
import 'package:flutter_application_1/datas/home_banner/home_banner.dart';
import 'package:flutter_application_1/http/dio_instance.dart';

import '../../datas/home_banner/datum.dart';

class HomeViewModel {
  static Future<List<Datum>?> getBanner() async {
    // Response responese = await DioInstance.instance().get(path: "");
    // HomeBanner bannerData = HomeBanner.fromJson(responese.data);
    // if (bannerData != null) {
    //   return bannerData.data;
    // }
    // return [];
  }
}
