import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:awesomeapp/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';

import '../domain/entity/photos_model.dart';
import '../domain/adapters/repository_adapter.dart';
import '../domain/entity/pagination_filter.dart';

class HomeController extends SuperController<Photos> {
  HomeController({required this.homeRepository});

  final IHomeRepository homeRepository;
  final grid = true.obs;
  final collapsed = true.obs;
  late ScrollController scrollController;
  final photoList = <Photo>[].obs;
  final lastPage = false.obs;
  final isLoading = false.obs;
  final _paginationFilter = PaginationFilter().obs;

  int? get limit => _paginationFilter.value.limit;
  int? get _page => _paginationFilter.value.page;

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
    ever(_paginationFilter, (_) => _getAllPhotos());
    _changePaginationFilter(1, 15);
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

  bool get _isAppBarExpanded {
    return scrollController.hasClients &&
        scrollController.offset > (170 - kToolbarHeight);
  }

  Future<void> _getAllPhotos() async {
    isLoading.value = true;
    final photosData = await homeRepository.getPhotos(_paginationFilter.value);
    if (photosData.photos!.isEmpty) {
      lastPage.value = true;
    }
    photoList.addAll(photosData.photos!);
    isLoading.value = true;
  }

  Future<void> refreshAllPhotos() async {
    photoList.clear();
    lastPage.value = false;
    isLoading.value = true;
    _changePaginationFilter(1, 15);
    final photosData = await homeRepository.getPhotos(_paginationFilter.value);
    if (photosData.photos!.isEmpty) {
      lastPage.value = true;
    }
    photoList.addAll(photosData.photos!);
    isLoading.value = true;
  }

  void changeTotalPerPage(int limitValue) {
    photoList.clear();
    lastPage.value = false;
    _changePaginationFilter(1, limitValue);
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.limit = limit;
    });
  }

  void loadNextPage() => _changePaginationFilter(_page! + 1, limit!);
}
