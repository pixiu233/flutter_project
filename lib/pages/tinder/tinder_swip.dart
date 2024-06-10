import 'dart:developer';
import 'dart:math';

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/apis/friends_vn.dart';
import 'package:flutter_application_1/datas/tinder_users/datum.dart';
import 'example_buttons.dart';

class TinderSwip extends StatefulWidget {
  final List<Datum>? candidates;

  const TinderSwip({super.key, required this.candidates});

  @override
  State<TinderSwip> createState() => _TinderSwipPageState();
}

class _TinderSwipPageState extends State<TinderSwip> {
  final AppinioSwiperController controller = AppinioSwiperController();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((_) {
      _shakeCard();
    });
    super.initState();
  }

  final List<String> tabActiveIcons = [
    "images/c/1.jpg",
    "images/c/2.jpg",
    "images/c/3.jpg",
    "images/c/4.jpg",
    "images/c/5.jpg",
    "images/c/6.jpg",
    "images/c/7.jpg",
  ];
  String getRandomIcon() {
    final random = Random();
    return tabActiveIcons[random.nextInt(tabActiveIcons.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .65,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 50,
                  bottom: 40,
                ),
                child: AppinioSwiper(
                  invertAngleOnBottomDrag: true,
                  backgroundCardCount: 3,
                  swipeOptions: const SwipeOptions.all(),
                  controller: controller,
                  onCardPositionChanged: (
                    SwiperPosition position,
                  ) {
                    //debugPrint('${position.offset.toAxisDirection()}, '
                    //    '${position.offset}, '
                    //    '${position.angle}');
                  },
                  onSwipeEnd: _swipeEnd,
                  onEnd: _onEnd,
                  cardCount: widget.candidates?.length ?? 0,
                  cardBuilder: (BuildContext context, int index) {
                    return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(index > 6
                                ? tabActiveIcons[(index / 7).toInt()]
                                : tabActiveIcons[index]), // 使用正确的图片路径替换
                            fit: BoxFit.cover, // 根据需要调整图片的缩放方式
                          ),
                        ),
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.all(
                                6.0,
                              ),
                              decoration: BoxDecoration(
                                // 添加这一部分来设置圆角
                                color: Color.fromARGB(215, 139, 139, 139),
                                borderRadius: BorderRadius.circular(
                                    7.0), // 设置圆角大小，数字越大圆角越明显
                              ),
                              child: Text(
                                widget.candidates?[index]?.username ??
                                    'Unknown',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        )

                        // color: const Color.fromARGB(255, 40, 43, 45),
                        );
                  },
                ),
              ),
            ),
            IconTheme.merge(
              data: const IconThemeData(size: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TutorialAnimationButton(_shakeCard),
                  const SizedBox(
                    width: 20,
                  ),
                  swipeLeftButton(controller),
                  const SizedBox(
                    width: 20,
                  ),
                  swipeRightButton(controller),
                  const SizedBox(
                    width: 20,
                  ),
                  unswipeButton(controller),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _swipeEnd(
      int previousIndex, int targetIndex, SwiperActivity activity) async {
    print(activity);
    switch (activity) {
      case Swipe():
        if (activity.direction == AxisDirection.right) {
          String userId = (widget.candidates?[previousIndex].userId).toString();
          var data = await FriendsModel.add_friend(userId);
        }
        print('The card was swiped to the : ${activity.direction}');
        print('previous index: $previousIndex, target index: $targetIndex');
        break;
      case Unswipe():
        print('A ${activity.direction.name} swipe was undone.');
        print('previous index: $previousIndex, target index: $targetIndex');
        break;
      case CancelSwipe():
        print('A swipe was cancelled');
        break;
      case DrivenActivity():
        print('Driven Activity');
        break;
    }
  }

  void _onEnd() {
    print('end reached!');
  }

  // Animates the card back and forth to teach the user that it is swipable.
  Future<void> _shakeCard() async {
    const double distance = 30;
    // We can animate back and forth by chaining different animations.
    // try {
    //   await controller.animateTo(
    //     const Offset(-distance, 0),
    //     duration: const Duration(milliseconds: 200),
    //     curve: Curves.easeInOut,
    //   );
    // } catch (e) {}

    //   await controller.animateTo(
    //     const Offset(distance, 0),
    //     duration: const Duration(milliseconds: 400),
    //     curve: Curves.easeInOut,
    //   );
    //   // We need to animate back to the center because `animateTo` does not center
    //   // the card for us.
    //   await controller.animateTo(
    //     const Offset(0, 0),
    //     duration: const Duration(milliseconds: 200),
    //     curve: Curves.easeInOut,
    //   );
  }
}
