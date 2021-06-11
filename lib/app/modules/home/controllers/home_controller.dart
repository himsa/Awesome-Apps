import 'package:auto_animated/auto_animated.dart';
import 'package:awesomeapp/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final grid = true.obs;
  final collapsed = true.obs;
  late ScrollController scrollController;
  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController()
      ..addListener(() {
        if (_isAppBarExpanded) {
          collapsed.value = false;
        } else {
          collapsed.value = true;
        }
      });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void setGrid() => grid.value = true;
  void setList() => grid.value = false;
  void setCollapsed(bool value) => collapsed.value = value;
  void gotoDetail() => Get.toNamed(Routes.DETAIL);

  bool get _isAppBarExpanded {
    return scrollController.hasClients &&
        scrollController.offset > (170 - kToolbarHeight);
  }

  final options = LiveOptions(
    // Start animation after (default zero)
    delay: Duration(seconds: 1),

    // Show each item through (default 250)
    showItemInterval: Duration(milliseconds: 500),

    // Animation duration (default 250)
    showItemDuration: Duration(seconds: 1),

    // Animations starts at 0.05 visible
    // item fraction in sight (default 0.025)
    visibleFraction: 0.05,

    // Repeat the animation of the appearance
    // when scrolling in the opposite direction (default false)
    // To get the effect as in a showcase for ListView, set true
    reAnimateOnVisibility: false,
  );
}
