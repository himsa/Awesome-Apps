import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => CustomScrollView(
          controller: controller.scrollController,
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.indigo,
              title: Visibility(
                visible: !controller.collapsed.value,
                child: Text(''),
              ),
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  'https://coverfiles.alphacoders.com/965/thumb-1920-96570.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              expandedHeight: MediaQuery.of(context).size.height * 0.7,
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. #',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
