import 'package:parking_lot_joao/features/parking_space/data/models/parking_space_model.dart';

extension ListParkingSpaceModelExtension on List<ParkingSpaceModel> {
  List<ParkingSpaceModel> ordinate() {
    sort((a, b) => a.number.compareTo(b.number));

    return this;
  }
}
