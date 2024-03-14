import 'package:flutter/material.dart';

import 'package:parking_lot_joao/common/layout/components/app_text.dart';
import 'package:parking_lot_joao/common/layout/foundation/app_shapes.dart';
import 'package:parking_lot_joao/common/theme/theme_global.dart';
import 'package:parking_lot_joao/features/parking_space/domain/models/parking_space_model.dart';

class CardParkingSpaceWidget extends StatefulWidget {
  final ParkingSpaceModel parkingSpace;
  final Function() checkIn;
  final Function() checkOut;
  const CardParkingSpaceWidget({
    super.key,
    required this.parkingSpace,
    required this.checkIn,
    required this.checkOut,
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
        height: 120,
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(4),
        decoration: AppShapes.decoration(
            radius: RadiusSize.small,
            border: ShapesBorder(appColors.blue, borderWidth: 2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: 'Vaga ${widget.parkingSpace.number}',
              textStyle: AppTextStyle.headerH4,
              textColor: appColors.blueDark,
            ),
            Visibility(
              visible: widget.parkingSpace.isOccupied,
              replacement: InkWell(
                onTap: widget.checkIn,
                child: Container(
                  decoration: AppShapes.decoration(
                    radius: RadiusSize.extraSmall,
                    color: appColors.green,
                  ),
                  height: 60,
                  margin: const EdgeInsets.only(top: 10),
                  child: Center(
                    child: AppText(
                      text: 'Entrada',
                      textStyle: AppTextStyle.headerH3,
                      textColor: appColors.white,
                    ),
                  ),
                ),
              ),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // AppText(
                      //   text: 'Placa: ${widget.parkingSpace.licensePlate}',
                      //   textStyle: AppTextStyle.paragraphLargeBold,
                      //   textColor: appColors.grey,
                      // ),
                      AppText(
                        text:
                            'Entrada: ${widget.parkingSpace.startTime?.hour}:${widget.parkingSpace.endTime?.minute}0',
                        textStyle: AppTextStyle.paragraphLargeBold,
                        textColor: appColors.grey,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: widget.checkOut,
                    child: Container(
                      decoration: AppShapes.decoration(
                        radius: RadiusSize.extraSmall,
                        color: appColors.red,
                      ),
                      height: 30,
                      child: Center(
                        child: AppText(
                          text: 'Saída',
                          textStyle: AppTextStyle.headerH4,
                          textColor: appColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  // Row(
  //       children: [
  //         Container(
  //           width: 100,
  //           height: double.infinity,
  //           color: colorOccupied,
  //           child: Center(
  //             child: AppText(
  //               text: 'Vaga ${widget.parkingSpace.number}',
  //               textStyle: AppTextStyle.headerH3,
  //               textColor: appColors.greyDark,
  //             ),
  //           ),
  //         ),
  //         const SizedBox(width: 10),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             AppText(
  //               text: 'Placa: ${widget.parkingSpace.licensePlate}',
  //               textStyle: AppTextStyle.headerH4,
  //               textColor: appColors.grey,
  //             ),
  //             Visibility(
  //               visible: widget.parkingSpace.startTime != null,
  //               child: AppText(
  //                 text:
  //                     'Entrada: ${widget.parkingSpace.startTime?.hour}:${widget.parkingSpace.endTime?.minute}0',
  //                 textStyle: AppTextStyle.paragraphMediumBold,
  //                 textColor: appColors.grey,
  //               ),
  //             ),
  //           ],
  //         ),
  //         const Spacer(),
  //         IconButton(
  //           onPressed: () {},
  //           icon: Icon(
  //             Icons.edit,
  //             color: appColors.colorBrandPrimaryBlue,
  //           ),
  //         )
  //       ],
  //     ),
}
