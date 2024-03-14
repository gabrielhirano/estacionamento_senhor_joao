import 'package:parking_lot_joao/features/history/domain/repositories/history_repository.dart';

class GetHistoryUseCase {
  final HistoryRepository _repository;

  GetHistoryUseCase(this._repository);

  Future call() => _repository.getHistory();
}
