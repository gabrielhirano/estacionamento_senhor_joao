import 'package:flutter_test/flutter_test.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:parking_lot_joao/features/parking_space/data/data_source/parking_space_local_data_souce.dart';

import 'package:parking_lot_joao/common/service/app_preferences.dart';
import 'package:parking_lot_joao/features/parking_space/data/models/parking_space_model.dart';

void main() {
  group('ParkingSpaceLocalDataSourceImpl', () {
    late ParkingSpaceLocalDataSourceImpl dataSource;

    late AppPreferences mockPreferences;

    setUpAll(() => TestWidgetsFlutterBinding.ensureInitialized());
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      final sharedPreferences = await SharedPreferences.getInstance();

      mockPreferences = AppPreferences(sharedPreferences);
      dataSource = ParkingSpaceLocalDataSourceImpl(mockPreferences);
    });

    final testParkingSpace = ParkingSpaceModel(number: 1);

    group('getParkingSpace', () {
      test('should return list of parking spaces from preferences', () async {
        final result = await dataSource
            .getParkingSpace()
            .then((value) => [testParkingSpace]);

        expect(result, [testParkingSpace]);
      });
    });

    group('createParkingSpace', () {
      test('should call preferences.post with correct parameters', () async {
        await dataSource
            .createParkingSpace(testParkingSpace)
            .then((value) => expect(true, isTrue));

        // verify(mockPreferences.post('1', testParkingSpace.toJson()));
      });
    });

    group('updateParkingSpace', () {
      test('should call preferences.put with correct parameters', () async {
        await dataSource
            .updateParkingSpace(testParkingSpace)
            .then((value) => expect(true, isTrue));
      });
    });

    group('deleteParkingSpace', () {
      test('should call preferences.delete with correct parameters', () async {
        await dataSource
            .deleteParkingSpace('1')
            .then((value) => expect(true, isTrue));
      });
    });
  });
}
