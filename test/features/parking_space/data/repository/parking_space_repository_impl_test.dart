import 'package:flutter_test/flutter_test.dart';

import 'package:parking_lot_joao/common/service/app_preferences.dart';
import 'package:parking_lot_joao/features/parking_space/data/data_source/parking_space_remote_data_souce.dart';
import 'package:parking_lot_joao/features/parking_space/data/repository/parking_space_repository_impl.dart';
import 'package:parking_lot_joao/features/parking_space/domain/models/parking_space_model.dart';
import 'package:parking_lot_joao/features/parking_space/domain/repositories/parking_space_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late ParkingSpaceLocalDataSource parkingSpaceLocalDataSource;
  late ParkingSpaceRepository repository;
  late ParkingSpaceModel model;

  setUpAll(() => TestWidgetsFlutterBinding.ensureInitialized());

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final sharedPreferences = await SharedPreferences.getInstance();
    parkingSpaceLocalDataSource =
        ParkingSpaceLocalDataSourceImpl(AppPreferences(sharedPreferences));

    repository = ParkingSpaceRepositoryImpl(parkingSpaceLocalDataSource);
    model = ParkingSpaceModel(
      number: 1,
      licensePlate: 'ABC1234',
      occupied: false,
      startTime: DateTime(2024, 3, 12, 11, 0),
      endTime: DateTime(2024, 3, 12, 12, 0),
    );
  });

  group('ParkingSpaceReposityImpl', () {
    test(
        'should return ParkingSpaceModel when the remote datasource returns correctly',
        () async {
      await parkingSpaceLocalDataSource.createParkingSpace(model);

      final result = await repository.getParkingSpaceModel(
          spaceNumber: model.number.toString());

      expect(result.first.number, model.number);
    });
  });
}
