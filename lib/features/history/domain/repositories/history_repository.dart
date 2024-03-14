abstract class HistoryRepository {
  Future<List<String>> getHistory();
  Future recordHistoryInformation(String information);
}
