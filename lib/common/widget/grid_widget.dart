import 'package:flutter/material.dart';

class GridWiget extends StatefulWidget {
  final SliverGridDelegate gridDelegate;
  final Widget Function(BuildContext, int) itemBuilder;
  final int itemCount;

  const GridWiget({
    super.key,
    required this.gridDelegate,
    required this.itemBuilder,
    required this.itemCount,
  });

  @override
  State<GridWiget> createState() => _GridWigetState();
}

class _GridWigetState extends State<GridWiget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      primary: false,
      gridDelegate: widget.gridDelegate,
      itemBuilder: widget.itemBuilder,
      itemCount: widget.itemCount,
    );
  }
}
