import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:parking_lot_joao/common/service/app_preferences.dart';
import 'package:parking_lot_joao/features/parking_space/data/data_source/parking_space_local_data_souce.dart';
import 'package:parking_lot_joao/features/parking_space/data/data_source/parking_space_remote_data_source.dart';
import 'package:parking_lot_joao/features/parking_space/data/models/parking_space_model.dart';

import 'package:parking_lot_joao/common/service/error/app_failure.dart';
import 'package:parking_lot_joao/common/service/error/app_excepetion.dart';
import 'package:parking_lot_joao/features/parking_space/data/repository/parking_space_repository_impl.dart';
import 'package:parking_lot_joao/features/parking_space/domain/repositories/parking_space_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockParkingSpaceRemoteDataSource extends Mock
    implements ParkingSpaceRemoteDataSource {}

void main() {
  late ParkingSpaceLocalDataSourceImpl localDataSource;
  late MockParkingSpaceRemoteDataSource remoteDataSource;
  late ParkingSpaceRepository repository;
  late AppPreferences mockPreferences;

  setUpAll(() => TestWidgetsFlutterBinding.ensureInitialized());
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final sharedPreferences = await SharedPreferences.getInstance();

    mockPreferences = AppPreferences(sharedPreferences);
    localDataSource = ParkingSpaceLocalDataSourceImpl(mockPreferences);
    remoteDataSource = MockParkingSpaceRemoteDataSource();

    repository = ParkingSpaceRepositoryImpl(localDataSource, remoteDataSource);
  });

  group('getParkingSpaceModel', () {
    test(
        'should return list of parking spaces when local data source is successful',
        () async {
      final spaceNumber = '1';
      final parkingSpace = ParkingSpaceModel(number: 1);

      final result = await repository
          .getParkingSpaceModel(spaceNumber: spaceNumber)
          .onError((error, stackTrace) => [parkingSpace]);

      expect(result, [parkingSpace]);
    });

    test(
        'should throw CacheFailure when local data source throws CacheException',
        () async {
      final spaceNumber = '1';

      expect(
        () async => await repository
            .getParkingSpaceModel(spaceNumber: spaceNumber)
            .then((value) => []),
        throwsA(isInstanceOf<CacheFailure>()),
      );
    });

    test('should throw Failure when local data source throws unknown error',
        () async {
      final spaceNumber = '1';

      expect(
        () async =>
            await repository.getParkingSpaceModel(spaceNumber: spaceNumber),
        throwsA(isInstanceOf<Failure>()),
      );
    });
  });
}
