import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            leading: Card(
              shape: CircleBorder(),
              child: BackButton(
                color: Colors.black,
              ),
            ),
            title: Text(
              'Detail ${controller.data!.id}',
              style: TextStyle(color: Colors.black),
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
            expandedHeight: MediaQuery.of(context).size.height * 0.7,
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ID : ${controller.data!.id}",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Average Color : ",
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            Container(
                              color: Color(
                                controller.color.value,
                              ),
                              padding: EdgeInsets.all(3.0),
                              child: Text(
                                "${controller.data!.avgColor!}",
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    onPressed: () => controller.openUrl(controller.data!.url!),
                  ),
                  TextButton(
                    child: Row(
                      children: [
                        Text(
                          "📷 ",
                        ),
                        Text(
                          "${controller.data!.photographer!}",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                    onPressed: () =>
                        controller.openUrl(controller.data!.photographerUrl!),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
