import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parking_lot_joao/common/service/error/app_failure.dart';
import 'package:parking_lot_joao/common/util/extension/list_extension.dart';
import 'package:parking_lot_joao/features/parking_space/data/models/parking_space_model.dart';
import 'package:parking_lot_joao/features/parking_space/domain/use_cases/clear_parking_space_use_case.dart';
import 'package:parking_lot_joao/features/parking_space/domain/use_cases/get_parking_spaces_use_case.dart';
import 'package:parking_lot_joao/features/parking_space/domain/use_cases/set_check_in_use_case.dart';
import 'package:parking_lot_joao/features/parking_space/domain/use_cases/set_check_out_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetParkingSpacesUseCase _getParkingSpacesUseCase;
  final SetCheckInUseCase _setCheckInUseCase;
  final SetCheckOutUseCase _setCheckOutUseCase;
  final ClearParkingSpaceUseCase _clearParkingSpaceUseCase;

  HomeBloc(
    this._getParkingSpacesUseCase,
    this._setCheckInUseCase,
    this._setCheckOutUseCase,
    this._clearParkingSpaceUseCase,
  ) : super(HomeState(status: HomeStatus.idle, parkingSpaces: [])) {
    on(_onGetParkingSpaces);
    on(_onSetCheckIn);
    on(_onSetCheckOut);
    on(_onClearParkingSpace);
  }

  _onGetParkingSpaces(
    GetParkingSpacesEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));

    await _getParkingSpacesUseCase().then((sucess) {
      emit(state.copyWith(
        status: HomeStatus.success,
        parkingSpaces: sucess.ordinate(),
      ));
    }).onError((error, stack) {
      final failure = (error is Failure) ? error : null;

      emit(state.copyWith(status: HomeStatus.failure, failure: failure));
    });
  }

  _onSetCheckIn(
    SetCheckInEvent event,
    Emitter<HomeState> emit,
  ) async {
    await _setCheckInUseCase(event.parkingSpace)
        .then((sucess) => emit(state.copyWith(status: HomeStatus.success)))
        .catchError((error) =>
            emit(state.copyWith(status: HomeStatus.failure, failure: error)));
  }

  _onSetCheckOut(
    SetCheckOutEvent event,
    Emitter<HomeState> emit,
  ) async {
    await _setCheckOutUseCase(event.parkingSpace)
        .then((sucess) => emit(state.copyWith(status: HomeStatus.success)))
        .catchError((error) =>
            emit(state.copyWith(status: HomeStatus.failure, failure: error)));
  }

  _onClearParkingSpace(
    ClearParkingSpaceEvent event,
    Emitter<HomeState> emit,
  ) async {
    await _clearParkingSpaceUseCase(event.parkingSpace)
        .then((sucess) => emit(state.copyWith(status: HomeStatus.success)))
        .catchError((error) =>
            emit(state.copyWith(status: HomeStatus.failure, failure: error)));
  }
}
