import 'package:parking_lot_joao/features/parking_space/domain/models/parking_space_model.dart';

extension ListParkingSpaceModelExtension on List<ParkingSpaceModel> {
  List<ParkingSpaceModel> order() {
    sort((a, b) => a.number.compareTo(b.number));

    return this;
  }
}
