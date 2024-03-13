import 'package:get_it/get_it.dart';
import 'package:parking_lot_joao/features/home/presentation/bloc/home_bloc.dart';

mixin HomeInjection {
  static Future<void> inject(GetIt getIt) async {
    getIt.registerLazySingleton<HomeBloc>(() => HomeBloc(getIt()));
  }
}
