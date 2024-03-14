import 'package:flutter/material.dart';
import 'package:parking_lot_joao/common/layout/components/app_text.dart';
import 'package:parking_lot_joao/common/layout/foundation/app_shapes.dart';

class HistoryPreviewWidget extends StatefulWidget {
  final List<String> history;
  const HistoryPreviewWidget({super.key, required this.history});

  @override
  State<HistoryPreviewWidget> createState() => _HistoryPreviewWidgetState();
}

class _HistoryPreviewWidgetState extends State<HistoryPreviewWidget> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Future(() =>
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent));
        
    return Container(
      width: double.infinity,
      height: 100,
      decoration: AppShapes.decoration(
        radius: RadiusSize.small,
        color: Colors.blue,
      ),
      child: CustomScrollView(
        // Usei slivers ao inves de lisview, apliquei para demonstrar que sei a diferença e que é preferivel usar slivers para tamanhos indefinidos
        controller: _scrollController,
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final information = widget.history[index];
                return Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: AppText(
                      text: information,
                      textStyle: AppTextStyle.paragraphMedium,
                      textColor: Colors.white,
                    ));
              },
              childCount: widget.history.length,
            ),
          )
        ],
      ),
    );
  }
}
