import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/pages/home/home_vm.dart';
import 'package:flutter_application_1/pages/route/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

import '../../datas/home_banner/datum.dart';

const double paddingValue = 10.0;
const double borderRadiusValue = 6.0;
const double imageWidthHeight = 30.0;
const double textStyleFontSize = 18.0;
const double spacing = 5.0;
final List<String> tabActiveIcons = [
  "images/c/1.jpg",
  "images/c/2.jpg",
  "images/c/3.jpg",
  "images/c/4.jpg",
  "images/c/5.jpg",
  "images/c/6.jpg",
  "images/c/7.jpg",
];

// 可能放在一个公共样式文件或类中
final titleStyle = TextStyle(fontSize: textStyleFontSize);
final authorStyle = titleStyle.copyWith(fontSize: textStyleFontSize);
final topMarkStyle = titleStyle.copyWith(
  color: Colors.blue,
  fontWeight: FontWeight.bold,
);
BoxDecoration _borders() => BoxDecoration(
    border: Border.all(color: Colors.orange),
    borderRadius: BorderRadius.circular(borderRadiusValue));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

// 不被遮住的地方是SafeArea区域
//拿到homepage里面的成员变量
class _HomePageState extends State<HomePage> {
  List? bannerList = [
    "images/c/3.jpg",
    "images/c/4.jpg",
    "images/c/5.jpg",
  ];
  @override
  void initState() {
    super.initState();
    // initBannerData();
  }

  // void initBannerData() async {
  //   try {
  //     List<Datum>? bannerListData = await HomeViewModel.getBanner();
  //     setState(() {
  //       bannerList = bannerListData; // 更新状态
  //     });
  //   } on DioError catch (e) {
  //     print('Error fetching banners: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        SizedBox(width: double.infinity, height: 150.h, child: _banner()),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return _listItemView(index);
            },
          ),
        )
      ])),
    );
  }

  Widget _banner() {
    return SizedBox(
        height: 150.h,
        width: double.infinity,
        child: Swiper(
            itemBuilder: (context, index) {
              return Container(
                height: 150.h,
                width: double.infinity,
                margin: EdgeInsets.all(15.w),
                child: Image.asset(
                  bannerList?[index] ?? '',
                  fit: BoxFit.fill,
                ),
              );
            },
            itemCount: bannerList?.length ?? 0,
            pagination: const SwiperPagination(),
            control: const SwiperControl()));
  }

  Widget _listItemView(index) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, RoutePath.web_view);
        },
        child: _buildListItemContent(index));
  }

  Widget _buildListItemContent(index) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: paddingValue, vertical: paddingValue),
      padding: EdgeInsets.all(paddingValue),
      decoration: _borders(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _headerRow(index),
          SizedBox(height: spacing),
          Text('标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题'),
          SizedBox(height: spacing),
          _footerRow(),
        ],
      ),
    );
  }

  Widget _headerRow(index) => Row(
        children: [
          _clipRRectImage(index),
          SizedBox(width: spacing),
          Text('作者', style: authorStyle),
          SizedBox(width: spacing),
          Spacer(), // 使用Spacer替代Expanded以自动填充剩余空间
          Text('date:2014-2-5'),
          SizedBox(width: spacing),
          Text('置顶', style: topMarkStyle),
        ],
      );

  Widget _clipRRectImage(index) => ClipRRect(
        borderRadius: BorderRadius.circular(borderRadiusValue),
        child: Image.asset(
          tabActiveIcons[index % tabActiveIcons.length],
          width: imageWidthHeight,
          height: imageWidthHeight,
        ),
      );

  Widget _footerRow() => Row(
        children: [
          Text(
            '分类',
            style: TextStyle(color: Colors.green),
          ),
          Spacer(), // 同样使用Spacer
        ],
      );
}
