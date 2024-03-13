import 'package:flutter/material.dart';

import 'skeleton_widget.dart';

class SkeletonListWidget extends StatelessWidget {
  final int amount;
  final double radius;
  final double height;
  final EdgeInsets margin;

  const SkeletonListWidget({
    super.key,
    required this.amount,
    required this.radius,
    required this.height,
    required this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(
        amount,
        (index) {
          return SkeletonWidget(
            radius: radius,
            height: height,
            margin: margin,
          );
        },
      ).toList(),
    );
  }
}
