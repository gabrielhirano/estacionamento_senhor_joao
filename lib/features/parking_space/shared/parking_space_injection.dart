import 'package:get_it/get_it.dart';
import 'package:parking_lot_joao/common/config/dependency_injection.dart';
import 'package:parking_lot_joao/features/parking_space/data/data_source/parking_space_local_data_souce.dart';
import 'package:parking_lot_joao/features/parking_space/data/data_source/parking_space_remote_data_source.dart';
import 'package:parking_lot_joao/features/parking_space/data/repository/parking_space_repository_impl.dart';
import 'package:parking_lot_joao/features/parking_space/data/models/parking_space_model.dart';
import 'package:parking_lot_joao/features/parking_space/domain/repositories/parking_space_repository.dart';
import 'package:parking_lot_joao/features/parking_space/domain/use_cases/clear_parking_space_use_case.dart';
import 'package:parking_lot_joao/features/parking_space/domain/use_cases/get_parking_spaces_use_case.dart';
import 'package:parking_lot_joao/features/parking_space/domain/use_cases/set_check_in_use_case.dart';
import 'package:parking_lot_joao/features/parking_space/domain/use_cases/set_check_out_use_case.dart';

mixin ParkingSpaceInjection {
  static Future<void> inject(GetIt getIt) async {
    getIt.registerLazySingleton<ParkingSpaceRepository>(
      () => ParkingSpaceRepositoryImpl(getIt(), getIt()),
    );

    // Use Cases
    getIt.registerLazySingleton<GetParkingSpacesUseCase>(
      () => GetParkingSpacesUseCase(getIt()),
    );

    getIt.registerLazySingleton<SetCheckInUseCase>(
      () => SetCheckInUseCase(getIt()),
    );

    getIt.registerLazySingleton<SetCheckOutUseCase>(
      () => SetCheckOutUseCase(getIt()),
    );

    getIt.registerLazySingleton<ClearParkingSpaceUseCase>(
      () => ClearParkingSpaceUseCase(getIt()),
    );

    // Data
    getIt.registerLazySingleton<ParkingSpaceLocalDataSource>(
      () => ParkingSpaceLocalDataSourceImpl(getIt()),
    );
    getIt.registerLazySingleton<ParkingSpaceRemoteDataSource>(
      () => ParkingSpaceRemoteDataSourceImpl(getIt()),
    );

    await setupParkingSpaces();
  }

  static Future<void> setupParkingSpaces() async {
    final ParkingSpaceLocalDataSource parkingSpaceLocalDataSource =
        getIt<ParkingSpaceLocalDataSource>();

    await Future.wait([
      parkingSpaceLocalDataSource
          .createParkingSpace(ParkingSpaceModel(number: 1)),
      parkingSpaceLocalDataSource
          .createParkingSpace(ParkingSpaceModel(number: 2)),
      parkingSpaceLocalDataSource
          .createParkingSpace(ParkingSpaceModel(number: 3)),
      parkingSpaceLocalDataSource
          .createParkingSpace(ParkingSpaceModel(number: 4)),
      parkingSpaceLocalDataSource
          .createParkingSpace(ParkingSpaceModel(number: 5)),
      parkingSpaceLocalDataSource
          .createParkingSpace(ParkingSpaceModel(number: 6)),
      parkingSpaceLocalDataSource
          .createParkingSpace(ParkingSpaceModel(number: 7)),
      parkingSpaceLocalDataSource
          .createParkingSpace(ParkingSpaceModel(number: 8)),
      parkingSpaceLocalDataSource
          .createParkingSpace(ParkingSpaceModel(number: 9)),
      parkingSpaceLocalDataSource
          .createParkingSpace(ParkingSpaceModel(number: 10)),
    ]);
  }
}
