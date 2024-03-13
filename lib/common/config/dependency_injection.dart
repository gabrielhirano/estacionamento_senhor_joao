import 'package:parking_lot_joao/common/theme/app_colors.dart';
import 'package:get_it/get_it.dart';
import 'package:parking_lot_joao/features/parking_space/shared/parking_space_injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
mixin DependencyInjection {
  static Future<void> init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

    getIt.registerLazySingleton<AppColors>(() => AppColors());

    await Future.wait([
      ParkingSpaceInjection.inject(getIt),
    ]);
  }
}
