import 'package:flutter/material.dart';
import 'package:parking_lot_joao/common/theme/theme_global.dart';

class SkeletonWidget extends StatefulWidget {
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double radius;
  final double? width;
  final double? height;

  const SkeletonWidget({
    super.key,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.radius = 0,
    this.width,
    this.height,
  });

  @override
  createState() => SkeletonWidgetState();
}

class SkeletonWidgetState extends State<SkeletonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation gradientPosition;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);

    gradientPosition = Tween<double>(
      begin: -10,
      end: 10,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    )..addListener(() => Future(() => setState(() {})));

    _controller.repeat();

    super.initState();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(gradientPosition.value, 0),
            end: const Alignment(-1, 0),
            colors: [
              appColors.grey.withOpacity(0.2),
              appColors.grey.withOpacity(0.4),
              appColors.grey.withOpacity(0.2)
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(widget.radius))),
    );
  }
}
