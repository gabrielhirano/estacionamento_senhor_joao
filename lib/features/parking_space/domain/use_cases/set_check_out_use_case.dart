import 'package:parking_lot_joao/features/parking_space/data/models/parking_space_model.dart';
import 'package:parking_lot_joao/features/parking_space/domain/repositories/parking_space_repository.dart';

class SetCheckOutUseCase {
  final ParkingSpaceRepository _repository;

  SetCheckOutUseCase(this._repository);

  Future call(ParkingSpaceModel parkingSpace) {
    return _repository.setCheckOut(parkingSpace);
  }
}
