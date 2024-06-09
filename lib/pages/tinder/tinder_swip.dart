import 'dart:developer';

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                      alignment: Alignment.center,
                      child: Text(widget.candidates?[index]?.username ??
                          'Unknown'), // 添加空检查
                      color: CupertinoColors.activeBlue,
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

  void _swipeEnd(int previousIndex, int targetIndex, SwiperActivity activity) {
    print(activity);
    switch (activity) {
      case Swipe():
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
    await controller.animateTo(
      const Offset(-distance, 0),
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
    await controller.animateTo(
      const Offset(distance, 0),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    // We need to animate back to the center because `animateTo` does not center
    // the card for us.
    await controller.animateTo(
      const Offset(0, 0),
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }
}
