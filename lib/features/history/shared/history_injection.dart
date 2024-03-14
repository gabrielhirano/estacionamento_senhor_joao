import 'package:get_it/get_it.dart';
import 'package:parking_lot_joao/features/history/data/data_source/history_local_data_source.dart';
import 'package:parking_lot_joao/features/history/data/repository/history_repository_impl.dart';
import 'package:parking_lot_joao/features/history/domain/repositories/history_repository.dart';
import 'package:parking_lot_joao/features/history/domain/use_cases/get_history_use_case.dart';
import 'package:parking_lot_joao/features/history/domain/use_cases/record_history_information_use_case.dart';
import 'package:parking_lot_joao/features/history/presentation/bloc/history_bloc.dart';

mixin HistoryInjection {
  static Future<void> inject(GetIt getIt) async {
    getIt.registerLazySingleton<HistoryRepository>(
        () => HistoryRepositoryImpl(getIt()));

    // Use Cases
    getIt.registerLazySingleton<GetHistoryUseCase>(
        () => GetHistoryUseCase(getIt()));
    getIt.registerLazySingleton<RecordHistoryInformationUseCase>(
        () => RecordHistoryInformationUseCase(getIt()));

    // Bloc
    getIt.registerLazySingleton<HistoryBloc>(
        () => HistoryBloc(getIt(), getIt()));

    // Data
    getIt.registerLazySingleton<HistoryLocalDataSource>(
        () => HistoryLocalDataSourceImpl(getIt()));
  }
}
