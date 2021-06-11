import 'package:auto_animated/auto_animated.dart';
import 'package:awesomeapp/app/utils/list_utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Obx(
        () => CustomScrollView(
          controller: controller.scrollController,
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.indigo,
              title: Visibility(
                visible: !controller.collapsed.value,
                child: Text('Awesome Apps'),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    controller.setGrid();
                  },
                  icon: Icon(Icons.grid_view),
                ),
                IconButton(
                  onPressed: () {
                    controller.setList();
                  },
                  icon: Icon(Icons.view_list),
                ),
              ],
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  'https://coverfiles.alphacoders.com/965/thumb-1920-96570.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              expandedHeight: 200,
            ),
            controller.grid.value
                ? LiveSliverGrid(
                    controller: controller.scrollController,
                    showItemInterval: Duration(milliseconds: 50),
                    showItemDuration: Duration(milliseconds: 150),
                    visibleFraction: 0.001,
                    itemCount: 20,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 3,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: animationItemBuilder(
                      (index) => HorizontalItem(
                        onPressed: () {
                          print('click $index');
                        },
                        title:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. #' +
                                index.toString(),
                      ),
                    ),
                  )
                : LiveSliverList(
                    controller: controller.scrollController,
                    showItemInterval: Duration(milliseconds: 150),
                    showItemDuration: Duration(milliseconds: 350),
                    reAnimateOnVisibility: true,
                    itemCount: 20,
                    itemBuilder: animationItemBuilder(
                      (index) => VerticalItem(
                          onPressed: () {
                            print('click $index');
                          },
                          title:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. #' +
                                  index.toString()),
                      padding: EdgeInsets.symmetric(vertical: 2),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
