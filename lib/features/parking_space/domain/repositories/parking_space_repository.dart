import 'package:parking_lot_joao/features/parking_space/data/models/parking_space_model.dart';

abstract class ParkingSpaceRepository {
  Future<List<ParkingSpaceModel>> getParkingSpaceModel({String? spaceNumber});
  Future setCheckIn(ParkingSpaceModel parkingSpace);
  Future setCheckOut(ParkingSpaceModel parkingSpace);
  Future clearParkingSpace(ParkingSpaceModel parkingSpace);
}
