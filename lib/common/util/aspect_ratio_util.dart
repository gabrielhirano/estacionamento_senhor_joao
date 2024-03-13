import 'package:flutter/material.dart';

class AspectRatioUtil {
  static double calculateAspectRatio(
    BuildContext context, {
    required double crossAxisCount,
    required double crossAxisSpacing,
    required double height,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;

    double spacingWidth = (crossAxisCount - 1) * crossAxisSpacing;

    double availableWidth = screenWidth - spacingWidth;

    double itemTotalWidth = availableWidth / crossAxisCount;

    return itemTotalWidth / height;
  }
}
