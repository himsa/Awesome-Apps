import 'package:auto_animated/auto_animated.dart';
import 'package:awesomeapp/app/utils/list_utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => LazyLoadScrollView(
          onEndOfPage: controller.loadNextPage,
          isLoading: controller.lastPage.value,
          child: CustomScrollView(
            controller: controller.scrollController,
            slivers: <Widget>[
              SliverAppBar(
                title: Obx(
                  () => Visibility(
                    visible: !controller.collapsed.value,
                    child: Text('Awesome Apps'),
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      controller.setGrid();
                      print(controller.grid.value);
                    },
                    icon: Icon(Icons.grid_view),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.setList();
                      print(controller.grid.value);
                    },
                    icon: Icon(Icons.view_list),
                  ),
                ],
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/images/cyberpunk.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                expandedHeight: 200,
              ),
              SliverToBoxAdapter(
                child:
                    controller.grid.value ? _buildGridView() : _buildListView(),
              ),
              SliverToBoxAdapter(
                child: controller.isLoading.value
                    ? Container(
                        height: 60.0,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildGridView() {
    return Obx(
      () => LiveGrid.options(
        itemCount: controller.photoList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
          childAspectRatio: 0.7,
        ),
        shrinkWrap: true,
        primary: false,
        padding: EdgeInsets.all(16.0),
        itemBuilder: animationItemBuilder(
          (index) {
            final photo = controller.photoList[index];
            return VerticalItem(
              onPressed: () => controller.gotoDetail(photo),
              data: photo,
            );
          },
        ),
        options: options,
      ),
    );
  }

  _buildListView() {
    return Obx(
      () => LiveList.options(
        itemCount: controller.photoList.length,
        shrinkWrap: true,
        primary: false,
        padding: EdgeInsets.all(16.0),
        itemBuilder: animationItemBuilder(
          (index) {
            final photo = controller.photoList[index];
            return HorizontalItem(
              onPressed: () => controller.gotoDetail(photo),
              data: photo,
            );
          },
        ),
        options: options,
      ),
    );
  }
}
