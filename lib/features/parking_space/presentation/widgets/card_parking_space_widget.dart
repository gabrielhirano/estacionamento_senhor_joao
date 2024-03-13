import 'package:flutter/material.dart';
import 'package:parking_lot_joao/common/layout/components/app_text.dart';
import 'package:parking_lot_joao/common/layout/foundation/app_shapes.dart';
import 'package:parking_lot_joao/common/theme/theme_global.dart';
import 'package:parking_lot_joao/features/parking_space/domain/models/parking_space_model.dart';

class CardParkingSpaceWidget extends StatefulWidget {
  final ParkingSpaceModel parkingSpace;
  const CardParkingSpaceWidget({
    super.key,
    required this.parkingSpace,
  });

  @override
  State<CardParkingSpaceWidget> createState() => _CardParkingSpaceWidgetState();
}

class _CardParkingSpaceWidgetState extends State<CardParkingSpaceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: AppShapes.decoration(
        radius: RadiusSize.small,
        color: widget.parkingSpace.occupied
            ? appColors.redLight
            : appColors.greenLight,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AppText(
            text: 'Vaga',
            textStyle: AppTextStyle.headerH4,
          ),
          AppText(
            text: '${widget.parkingSpace.number}',
            textStyle: AppTextStyle.headerH3,
          ),
          AppText(
            text: widget.parkingSpace.licensePlate,
            textStyle: AppTextStyle.headerH4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppText(
                text: 'Entrada:',
                textStyle: AppTextStyle.paragraphSmallBold,
              ),
              const SizedBox(width: 5),
              AppText(
                text:
                    "${widget.parkingSpace.startTime?.hour}:${widget.parkingSpace.endTime?.minute}0",
                textStyle: AppTextStyle.paragraphSmallBold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
