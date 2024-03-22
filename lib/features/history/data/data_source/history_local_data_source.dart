import 'package:parking_lot_joao/common/service/app_preferences.dart';

abstract class HistoryLocalDataSource {
  Future<List<String>> getHistory();
  Future recordHistoryInformation(String information);
}

class HistoryLocalDataSourceImpl extends HistoryLocalDataSource {
  final AppPreferences _preferences;

  static const historyKey = "HISTORY_KEY";

  HistoryLocalDataSourceImpl(this._preferences);

  @override
  Future recordHistoryInformation(String information) async {
    List<String> history = await getHistory();
    history.add(information);

    return _preferences.setList(historyKey, history);
  }

  @override
  Future<List<String>> getHistory() => _preferences.getList(historyKey);
}
