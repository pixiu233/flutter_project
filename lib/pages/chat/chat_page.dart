import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/apis/friends_vn.dart';
import 'package:flutter_application_1/datas/not_yet_friends/datum.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChatPageState();
  }
}

class _ChatPageState extends State<ChatPage> {
  List<Datum>? dataList;

  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    try {
      List<Datum> data = await FriendsModel.get_not_yet_friend();
      setState(() {
        dataList = data; // 更新状态
      });
    } on DioError catch (e) {
      print('Error fetching : $e');
    }
  }

  void comfirm_friends(id) async {
    try {
      await FriendsModel.confirm_friend(id);
      initData();
    } on DioError catch (e) {
      print('Error fetching : $e');
    }
  }

  void delete_friends(id) async {
    try {
      await FriendsModel.delete_friend(id);
      initData();
    } on DioError catch (e) {
      print('Error fetching : $e');
    }
  }

  void doNothing() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemBuilder: (_, index) => Slidable(
                      key: const ValueKey(0),

                      // The end action pane is the one at the right or the bottom side.
                      endActionPane: ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          if (dataList![index].isConfirmed == false)
                            SlidableAction(
                              onPressed: (_) => comfirm_friends(
                                  dataList?[index].receiver?.userId),
                              backgroundColor: Color(0xFF0392CF),
                              foregroundColor: Colors.white,
                              icon: Icons.save,
                              label: '同意',
                            ),
                          SlidableAction(
                            onPressed: (_) => delete_friends(
                                dataList?[index].receiver?.userId),
                            backgroundColor: Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: '删除',
                          ),
                        ],
                      ),

                      child: GestureDetector(
                        child: dataList != null && dataList!.length > 0
                            ? _listItemView(index)
                            : SizedBox(),
                        onTap: () async {
                          print(index);
                        },
                      ),
                    ),
                itemCount: dataList != null && dataList!.length > 0
                    ? dataList!.length
                    : 0),
          ),
        ],
      ),
    ));
  }

  Widget _listItemView(index) {
    // 创建一个日期格式器
    final formatter = DateFormat('yyyy-MM-dd');

    // 使用格式器将 DateTime 转换为年月日字符串
    final dateString = formatter
        .format(dataList?[index].receiver!.createTime ?? DateTime.now());
    return ListTile(
      // contentPadding: EdgeInsets.only(left: 16.0),
      leading: Icon(Icons.android),
      title: Row(
        children: [
          Text(dataList?[index].receiver?.username ?? ''),
          Expanded(child: SizedBox()),
          Text(
            dateString,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
      subtitle: Text(
        dataList![index].isConfirmed == true ? '[已确认关系]' : '[待确认关系]',
        style: TextStyle(
            color: dataList![index].isConfirmed == true
                ? Colors.green
                : Colors.red,
            fontSize: 12),
      ),
    );
  }

  Widget _clipRRectImage() => ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.network(
          "",
          width: 10,
          height: 10,
        ),
      );
  Widget _buildListItemContent(index) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      // padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.orange),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              "assets/images/icon_home_selected.png",
              // dataList![index].receiver!.avatar ?? '',
              width: 10.w,
              height: 50,
            ),
          ),
          SizedBox(width: 10.w),
          Text('标题标题标题标题标题标题标题标题标题'),
        ],
      ),
    );
  }
}
