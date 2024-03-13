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
  Color get colorOccupied =>
      widget.parkingSpace.occupied ? appColors.redLight : appColors.greenLight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: AppShapes.decoration(
          radius: RadiusSize.small,
          border: ShapesBorder(colorOccupied, borderWidth: 3)),
      child: Row(
        children: [
          Container(
            width: 100,
            height: double.infinity,
            color: colorOccupied,
            child: Center(
              child: AppText(
                text: 'Vaga ${widget.parkingSpace.number}',
                textStyle: AppTextStyle.headerH3,
                textColor: appColors.greyDark,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                text: 'Placa: ${widget.parkingSpace.licensePlate}',
                textStyle: AppTextStyle.headerH4,
                textColor: appColors.grey,
              ),
              Visibility(
                visible: widget.parkingSpace.startTime != null,
                child: AppText(
                  text:
                      'Entrada: ${widget.parkingSpace.startTime?.hour}:${widget.parkingSpace.endTime?.minute}0',
                  textStyle: AppTextStyle.paragraphMediumBold,
                  textColor: appColors.grey,
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit,
              color: appColors.colorBrandPrimaryBlue,
            ),
          )
        ],
      ),
    );
  }
}
