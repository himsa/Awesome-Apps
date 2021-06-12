import 'package:awesomeapp/app/modules/home/domain/entity/photos_model.dart';
import 'package:flutter/material.dart';

class VerticalItem extends StatelessWidget {
  const VerticalItem({
    required this.data,
    required this.onPressed,
    required this.onOpenLink,
    Key? key,
  }) : super(
          key: key,
        );

  final Photo? data;
  final VoidCallback? onPressed;
  final VoidCallback? onOpenLink;

  @override
  Widget build(BuildContext context) => Container(
        height: 96,
        child: Stack(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      ),
                      child: Image.network(
                        data!.src!.small!,
                        fit: BoxFit.cover,
                        height: 96,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.only(left: 5.0),
                      child: InkWell(
                        onTap: onOpenLink,
                        child: Text(
                          "${data!.photographer!}",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class HorizontalItem extends StatelessWidget {
  const HorizontalItem({
    required this.data,
    required this.onPressed,
    required this.onOpenLink,
    Key? key,
  }) : super(
          key: key,
        );

  final Photo? data;
  final VoidCallback? onPressed;
  final VoidCallback? onOpenLink;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: InkWell(
                    onTap: onPressed,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                      child: Image.network(
                        data!.src!.landscape!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    child: InkWell(
                      onTap: onOpenLink,
                      child: Text(
                        "${data!.photographer!}",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}

/// Wrap Ui item with animation & padding
Widget Function(
  BuildContext context,
  int index,
  Animation<double> animation,
) animationItemBuilder(
  Widget Function(int index) child, {
  EdgeInsets padding = EdgeInsets.zero,
}) =>
    (
      BuildContext context,
      int index,
      Animation<double> animation,
    ) =>
        FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0, -0.1),
              end: Offset.zero,
            ).animate(animation),
            child: Padding(
              padding: padding,
              child: child(index),
            ),
          ),
        );

Widget Function(
  BuildContext context,
  Animation<double> animation,
) animationBuilder(
  Widget child, {
  double xOffset = 0,
  EdgeInsets padding = EdgeInsets.zero,
}) =>
    (
      BuildContext context,
      Animation<double> animation,
    ) =>
        FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(xOffset, 0.1),
              end: Offset.zero,
            ).animate(animation),
            child: Padding(
              padding: padding,
              child: child,
            ),
          ),
        );
