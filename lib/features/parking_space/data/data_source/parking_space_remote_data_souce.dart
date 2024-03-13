import 'package:parking_lot_joao/common/service/app_preferences.dart';
import 'package:parking_lot_joao/features/parking_space/domain/models/parking_space_model.dart';

abstract class ParkingSpaceLocalDataSource {
  Future<List<ParkingSpaceModel>> getParkingSpace({String? key});
  Future createParkingSpace(ParkingSpaceModel parkingSpace);
  Future updateParkingSpace(ParkingSpaceModel parkingSpace);
  Future deleteParkingSpace(String keyName);
}

class ParkingSpaceLocalDataSourceImpl extends ParkingSpaceLocalDataSource {
  final AppPreferences _preferences;

  ParkingSpaceLocalDataSourceImpl(this._preferences);

  @override
  Future<List<ParkingSpaceModel>> getParkingSpace({String? key}) async {
    return _preferences.get(key).then((response) {
      final list = response as List;
      final List<ParkingSpaceModel> parkingSpaces = [];

      for (var space in list) {
        parkingSpaces.add(ParkingSpaceModel.fromMap(space));
      }
      return parkingSpaces;
    }).catchError((error) => throw error);
  }

  @override
  Future createParkingSpace(ParkingSpaceModel parkingSpace) async {
    final String keyName = parkingSpace.number.toString();
    return _preferences.post(keyName, parkingSpace.toJson());
  }

  @override
  Future updateParkingSpace(ParkingSpaceModel parkingSpace) async {
    final String keyName = parkingSpace.number.toString();
    return _preferences.put(keyName, parkingSpace.toJson());
  }

  @override
  Future deleteParkingSpace(String keyName) async {
    return _preferences.delete(keyName);
  }
}
