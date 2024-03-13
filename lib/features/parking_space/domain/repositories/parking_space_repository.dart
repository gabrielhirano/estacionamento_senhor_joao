import 'package:parking_lot_joao/features/parking_space/domain/models/parking_space_model.dart';

abstract class ParkingSpaceRepository {
  Future<ParkingSpaceModel> getParkingSpaceModel({String? spaceNumber});
}
