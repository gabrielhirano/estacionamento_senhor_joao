import 'package:get_it/get_it.dart';
import 'package:parking_lot_joao/features/parking_space/data/data_source/parking_space_remote_data_souce.dart';
import 'package:parking_lot_joao/features/parking_space/data/repository/parking_space_repository_impl.dart';
import 'package:parking_lot_joao/features/parking_space/domain/repositories/parking_space_repository.dart';
import 'package:parking_lot_joao/features/parking_space/domain/use_cases/get_parking_spaces_use_case.dart';

mixin ParkingSpaceInjection {
  static Future<void> inject(GetIt getIt) async {
    getIt.registerLazySingleton<ParkingSpaceRepository>(
        () => ParkingSpaceRepositoryImpl(getIt()));
    getIt.registerLazySingleton<ParkingSpaceRepository>(
        () => ParkingSpaceRepositoryImpl(getIt()));

    // Use Cases
    getIt.registerLazySingleton<GetParkingSpacesUseCase>(
        () => GetParkingSpacesUseCase(getIt()));

    // Data
    getIt.registerLazySingleton<ParkingSpaceLocalDataSource>(
        () => ParkingSpaceLocalDataSourceImpl(getIt()));
  }
}
