import 'package:flutter_test/flutter_test.dart';

import 'package:parking_lot_joao/common/service/app_preferences.dart';
import 'package:parking_lot_joao/features/parking_space/data/data_source/parking_space_remote_data_souce.dart';
import 'package:parking_lot_joao/features/parking_space/domain/models/parking_space_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late ParkingSpaceLocalDataSource parkingSpaceLocalDataSource;

  setUpAll(() => TestWidgetsFlutterBinding.ensureInitialized());

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final sharedPreferences = await SharedPreferences.getInstance();
    parkingSpaceLocalDataSource =
        ParkingSpaceLocalDataSourceImpl(AppPreferences(sharedPreferences));
  });

  group('ParkingSpaceLocalDataSource', () {
    test('sucesso cadastro de vaga', () async {
      final parkingSpace1 = ParkingSpaceModel(
        number: 1,
        occupied: false,
        startTime: DateTime(2024, 3, 12, 11, 0),
        endTime: DateTime(2024, 3, 12, 12, 0),
      );

      final registered =
          await parkingSpaceLocalDataSource.createParkingSpace(parkingSpace1);

      expect(registered, equals(true));
    });

    test('buscar vaga especifica', () async {
      // primeiro limpar o que ja tenho na memoria
      final parkingSpace1 = ParkingSpaceModel(
        number: 1,
        occupied: false,
        startTime: DateTime(2024, 3, 12, 11, 0),
        endTime: DateTime(2024, 3, 12, 12, 0),
      );

      await parkingSpaceLocalDataSource.createParkingSpace(parkingSpace1);

      List<ParkingSpaceModel> spaces =
          await parkingSpaceLocalDataSource.getParkingSpace();

      expect(spaces.first.number, equals(parkingSpace1.number));
    });

    test('buscar vagas', () async {
      // primeiro limpar o que ja tenho na memoria
      final parkingSpace1 = ParkingSpaceModel(
        number: 1,
        occupied: false,
        startTime: DateTime(2024, 3, 12, 11, 0),
        endTime: DateTime(2024, 3, 12, 12, 0),
      );

      final parkingSpace2 = ParkingSpaceModel(
        number: 2,
        occupied: false,
        startTime: DateTime(2024, 3, 12, 11, 0),
        endTime: DateTime(2024, 3, 12, 12, 0),
      );

      final parkingSpace3 = ParkingSpaceModel(
        number: 3,
        occupied: false,
        startTime: DateTime(2024, 3, 12, 11, 0),
        endTime: DateTime(2024, 3, 12, 12, 0),
      );

      await Future.wait([
        parkingSpaceLocalDataSource.createParkingSpace(parkingSpace1),
        parkingSpaceLocalDataSource.createParkingSpace(parkingSpace2),
        parkingSpaceLocalDataSource.createParkingSpace(parkingSpace3)
      ]);

      List<ParkingSpaceModel> spacesMock = [
        parkingSpace1,
        parkingSpace2,
        parkingSpace3
      ];

      List<ParkingSpaceModel> spaces =
          await parkingSpaceLocalDataSource.getParkingSpace();

      expect(spaces.length, equals(spacesMock.length));
      // ordenar por numero da vaga

      for (int i = 0; i < spaces.length; i++) {
        expect(spaces[i].number, equals(spacesMock[i].number));
      }
    });
  });
}
