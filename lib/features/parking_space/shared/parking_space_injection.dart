import 'package:get_it/get_it.dart';
import 'package:parking_lot_joao/common/config/dependency_injection.dart';
import 'package:parking_lot_joao/features/parking_space/data/data_source/parking_space_remote_data_souce.dart';
import 'package:parking_lot_joao/features/parking_space/data/repository/parking_space_repository_impl.dart';
import 'package:parking_lot_joao/features/parking_space/domain/models/parking_space_model.dart';
import 'package:parking_lot_joao/features/parking_space/domain/repositories/parking_space_repository.dart';
import 'package:parking_lot_joao/features/parking_space/domain/use_cases/get_parking_spaces_use_case.dart';

mixin ParkingSpaceInjection {
  static Future<void> inject(GetIt getIt) async {
    getIt.registerLazySingleton<ParkingSpaceRepository>(
        () => ParkingSpaceRepositoryImpl(getIt()));

    // Use Cases
    getIt.registerLazySingleton<GetParkingSpacesUseCase>(
        () => GetParkingSpacesUseCase(getIt()));

    // Data
    getIt.registerLazySingleton<ParkingSpaceLocalDataSource>(
        () => ParkingSpaceLocalDataSourceImpl(getIt()));

    await setupParkingSpaces();
  }

  static Future<void> setupParkingSpaces() async {
    final ParkingSpaceLocalDataSource parkingSpaceLocalDataSource =
        getIt<ParkingSpaceLocalDataSource>();

    final parkingSpace1 = ParkingSpaceModel(
      number: 1,
      licensePlate: 'ABC1234',
      occupied: false,
      startTime: DateTime(2024, 3, 12, 11, 0),
      endTime: DateTime(2024, 3, 12, 12, 0),
    );

    final parkingSpace2 = ParkingSpaceModel(
      number: 2,
      licensePlate: 'DEF1234',
      occupied: true,
      startTime: DateTime(2024, 3, 12, 11, 0),
      endTime: DateTime(2024, 3, 12, 12, 0),
    );

    final parkingSpace3 = ParkingSpaceModel(
      number: 3,
      licensePlate: 'GHI1234',
      occupied: true,
      startTime: DateTime(2024, 3, 12, 11, 0),
      endTime: DateTime(2024, 3, 12, 12, 0),
    );

    await Future.wait([
      parkingSpaceLocalDataSource.createParkingSpace(parkingSpace1),
      parkingSpaceLocalDataSource.createParkingSpace(parkingSpace2),
      parkingSpaceLocalDataSource.createParkingSpace(parkingSpace3)
    ]);
  }
}
