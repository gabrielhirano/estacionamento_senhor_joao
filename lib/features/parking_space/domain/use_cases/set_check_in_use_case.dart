import 'package:parking_lot_joao/features/parking_space/domain/models/parking_space_model.dart';
import 'package:parking_lot_joao/features/parking_space/domain/repositories/parking_space_repository.dart';

class SetCheckInUseCase {
  final ParkingSpaceRepository _repository;

  SetCheckInUseCase(this._repository);

  Future call(ParkingSpaceModel parkingSpace) {
    return _repository.setCheckIn(parkingSpace);
  }
}
