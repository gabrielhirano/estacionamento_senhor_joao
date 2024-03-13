import 'package:parking_lot_joao/features/parking_space/domain/models/parking_space_model.dart';
import 'package:parking_lot_joao/features/parking_space/domain/repositories/parking_space_repository.dart';

class GetParkingSpacesUseCase {
  final ParkingSpaceRepository _repository;

  GetParkingSpacesUseCase(this._repository);

  Future<List<ParkingSpaceModel>> call({String? spaceNumber}) =>
      _repository.getParkingSpaceModel(spaceNumber: spaceNumber);
}
