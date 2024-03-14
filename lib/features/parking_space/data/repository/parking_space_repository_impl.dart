import 'package:parking_lot_joao/features/parking_space/data/data_source/parking_space_remote_data_souce.dart';
import 'package:parking_lot_joao/features/parking_space/domain/models/parking_space_model.dart';
import 'package:parking_lot_joao/features/parking_space/domain/repositories/parking_space_repository.dart';

class ParkingSpaceRepositoryImpl implements ParkingSpaceRepository {
  final ParkingSpaceLocalDataSource _parkingSpaceLocalDataSource;

  ParkingSpaceRepositoryImpl(this._parkingSpaceLocalDataSource);

  @override
  Future<List<ParkingSpaceModel>> getParkingSpaceModel({String? spaceNumber}) {
    return _parkingSpaceLocalDataSource
        .getParkingSpace(key: spaceNumber)
        .catchError((error) =>
            throw error); // tratar erro para suas abstrações caso seja necessario
  }

  @override
  Future setCheckIn(ParkingSpaceModel parkingSpace) {
    return _parkingSpaceLocalDataSource.updateParkingSpace(parkingSpace);
  }

  @override
  Future setCheckOut(ParkingSpaceModel parkingSpace) {
    return _parkingSpaceLocalDataSource.updateParkingSpace(parkingSpace);
  }

  @override
  Future clearParkingSpace(ParkingSpaceModel parkingSpace) {
    return _parkingSpaceLocalDataSource.updateParkingSpace(parkingSpace);
  }
}
