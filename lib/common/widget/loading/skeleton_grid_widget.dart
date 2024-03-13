import 'package:flutter/material.dart';

import 'skeleton_widget.dart';

class SkeletonGridWidget extends StatelessWidget {
  final int amount;
  final double radius;

  final SliverGridDelegate gridDelegate;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  const SkeletonGridWidget({
    super.key,
    required this.gridDelegate,
    required this.amount,
    required this.radius,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: gridDelegate,
        itemCount: amount,
        itemBuilder: (BuildContext context, int index) {
          return SkeletonWidget(
            radius: radius,
          );
        },
      ),
    );
  }
}
