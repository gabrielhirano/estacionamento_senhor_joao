import 'package:bloc/bloc.dart';
import 'package:parking_lot_joao/common/util/extension/list_extension.dart';
import 'package:parking_lot_joao/features/parking_space/domain/models/parking_space_model.dart';
import 'package:parking_lot_joao/features/parking_space/domain/use_cases/get_parking_spaces_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetParkingSpacesUseCase _getParkingSpacesUseCase;

  HomeBloc(this._getParkingSpacesUseCase)
      : super(HomeState(status: HomeStatus.idle, parkingSpaces: [])) {
    on(_onGetParkingSpaces);
  }

  _onGetParkingSpaces(
    GetParkingSpacesEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    await Future.delayed(const Duration(seconds: 2));
    await _getParkingSpacesUseCase()
        .then((sucess) => emit(state.copyWith(
            status: HomeStatus.success, parkingSpaces: sucess.order())))
        .catchError((error) =>
            emit(state.copyWith(status: HomeStatus.error, error: error)));
  }
}
