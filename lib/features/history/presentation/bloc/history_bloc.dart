import 'package:bloc/bloc.dart';

import 'package:parking_lot_joao/features/history/domain/use_cases/get_history_use_case.dart';
import 'package:parking_lot_joao/features/history/domain/use_cases/record_history_information_use_case.dart';
import 'package:parking_lot_joao/features/parking_space/data/models/parking_space_model.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final GetHistoryUseCase _getHistoryUseCase;
  final RecordHistoryInformationUseCase _historyInformationUseCase;

  HistoryBloc(
    this._getHistoryUseCase,
    this._historyInformationUseCase,
  ) : super(HistoryState(status: HistoryStatus.loading, history: [])) {
    on(_onGetHistory);
    on(_onRecordInformation);
  }

  _onGetHistory(
    GetHistoryEvent event,
    Emitter<HistoryState> emit,
  ) async {
    emit(state.copyWith(status: HistoryStatus.loading));

    await _getHistoryUseCase()
        .then((sucess) => emit(
            state.copyWith(status: HistoryStatus.success, history: sucess)))
        .catchError((error) =>
            emit(state.copyWith(status: HistoryStatus.error, error: error)));
  }

  _onRecordInformation(
    RecordHistoryInformationEvent event,
    Emitter<HistoryState> emit,
  ) async {
    emit(state.copyWith(status: HistoryStatus.loading));

    await _historyInformationUseCase(event.parkingSpace.log).then((sucess) {
      emit(state.copyWith(status: HistoryStatus.success));

      add(GetHistoryEvent());
    }).catchError((error) {
      emit(state.copyWith(status: HistoryStatus.error, error: error));
    });
  }
}
