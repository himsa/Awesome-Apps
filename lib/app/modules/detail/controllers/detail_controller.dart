import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  final collapsed = true.obs;
  late ScrollController scrollController;
  var data = Get.arguments;
  @override
  void onInit() {
    super.onInit();
    data = Get.arguments;
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

  void setCollapsed(bool value) => collapsed.value = value;

  bool get _isAppBarExpanded {
    return scrollController.hasClients &&
        scrollController.offset > (170 - kToolbarHeight);
  }
}
