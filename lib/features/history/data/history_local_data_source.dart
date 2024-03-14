import 'package:parking_lot_joao/common/service/app_preferences.dart';

abstract class HistoryDataSource {
  Future createParkingSpace(String register);
}

class HistoryDataSourceImpl extends HistoryDataSource {
  final AppPreferences _preferences;

  static const historyKey = "HISTORY_KEY";

  HistoryDataSourceImpl(this._preferences);

  @override
  Future createParkingSpace(String register) async {
    throw UnimplementedError();
  }
}
