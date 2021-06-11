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
                  controller.data.src.original!,
                  fit: BoxFit.cover,
                ),
              ),
              expandedHeight: MediaQuery.of(context).size.height * 0.7,
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  controller.data.photographer!,
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
