import 'package:cached_network_image/cached_network_image.dart';
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
              backgroundColor: Colors.white,
              leading: Card(
                shape: CircleBorder(),
                child: BackButton(
                  color: Colors.black,
                ),
              ),
              title: Visibility(
                visible: !controller.collapsed.value,
                child: Text(''),
              ),
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: CachedNetworkImage(
                  imageUrl: controller.data!.src!.original!,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              expandedHeight: MediaQuery.of(context).size.height * 0.9,
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
