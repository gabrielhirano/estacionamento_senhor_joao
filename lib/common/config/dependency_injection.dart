import 'package:parking_lot_joao/common/service/app_preferences.dart';
import 'package:parking_lot_joao/common/theme/app_colors.dart';
import 'package:get_it/get_it.dart';
import 'package:parking_lot_joao/features/home/shared/home_injection.dart';
import 'package:parking_lot_joao/features/parking_space/shared/parking_space_injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

mixin DependencyInjection {
  static Future<void> init() async {
    getIt.registerLazySingleton<AppColors>(() => AppColors());
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerLazySingleton<AppPreferences>(
        () => AppPreferences(sharedPreferences));

    Future.wait([
      ParkingSpaceInjection.inject(getIt),
      HomeInjection.inject(getIt),
    ]);
  }
}
