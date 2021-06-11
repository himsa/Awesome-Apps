import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:auto_animated/auto_animated.dart';

import 'package:awesomeapp/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';

import '../domain/entity/photos_model.dart';
import '../domain/adapters/repository_adapter.dart';

class HomeController extends SuperController<Photos> {
  HomeController({required this.homeRepository});

  final IHomeRepository homeRepository;
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
    //Loading, Success, Error handle with 1 line of code
    append(() => homeRepository.getPhotos);
  }

  @override
  void onReady() {
    print('The build method is done. '
        'Your controller is ready to call dialogs and snackbars');
    super.onReady();
  }

  @override
  void onClose() {
    print('onClose called');
    super.onClose();
  }

  @override
  void didChangeMetrics() {
    print('the window size did change');
    super.didChangeMetrics();
  }

  @override
  void didChangePlatformBrightness() {
    print('platform change ThemeMode');
    super.didChangePlatformBrightness();
  }

  @override
  Future<bool> didPushRoute(String route) {
    print('the route $route will be open');
    return super.didPushRoute(route);
  }

  @override
  Future<bool> didPopRoute() {
    print('the current route will be closed');
    return super.didPopRoute();
  }

  @override
  void onDetached() {
    print('onDetached called');
  }

  @override
  void onInactive() {
    print('onInative called');
  }

  @override
  void onPaused() {
    print('onPaused called');
  }

  @override
  void onResumed() {
    print('onResumed called');
  }

  void setGrid() => grid.value = true;
  void setList() => grid.value = false;
  void setCollapsed(bool value) => collapsed.value = value;
  void gotoDetail(dynamic args) => Get.toNamed(Routes.DETAIL, arguments: args);
  void openUrl(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

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
