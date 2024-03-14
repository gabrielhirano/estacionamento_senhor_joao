import 'package:parking_lot_joao/features/history/data/data_source/history_local_data_source.dart';
import 'package:parking_lot_joao/features/history/domain/repositories/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final HistoryLocalDataSource _historyLocalDataSource;

  HistoryRepositoryImpl(this._historyLocalDataSource);

  @override
  Future<List<String>> getHistory() => _historyLocalDataSource.getHistory();

  @override
  Future recordHistoryInformation(String information) =>
      _historyLocalDataSource.recordHistoryInformation(information);
}
