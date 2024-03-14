import 'package:parking_lot_joao/features/history/domain/repositories/history_repository.dart';

class RecordHistoryInformationUseCase {
  final HistoryRepository _repository;

  RecordHistoryInformationUseCase(this._repository);

  Future call(String information) =>
      _repository.recordHistoryInformation(information);
}
