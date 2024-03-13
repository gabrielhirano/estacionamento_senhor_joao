import 'package:parking_lot_joao/common/theme/app_colors.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
mixin DependencyInjection {
  static Future<void> init() async {
    getIt.registerLazySingleton<AppColors>(() => AppColors());
  }
}
