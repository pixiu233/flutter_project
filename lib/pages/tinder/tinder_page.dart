import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/datas/tinder_users/datum.dart';
import 'package:flutter_application_1/pages/tinder/tinder_swip.dart';
import 'package:flutter_application_1/pages/tinder/tinder_vm.dart';

class TinderPage extends StatefulWidget {
  const TinderPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TinderPageState();
  }
}

class _TinderPageState extends State<TinderPage> {
  List<Datum>? dataList;

  @override
  void initState() {
    super.initState();
    initTinderUserData();
  }

  void initTinderUserData() async {
    try {
      List<Datum>? tinderUsersListData =
          await TinderUsersModel.getTinderUsers();
      setState(() {
        dataList = tinderUsersListData; // 更新状态
      });
    } on DioError catch (e) {
      print('Error fetching banners: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CupertinoPageScaffold(
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: dataList!.length > 0
                  ? TinderSwip(
                      candidates: dataList,
                    )
                  : SizedBox()),
        ),
      ),
    );
  }
}
