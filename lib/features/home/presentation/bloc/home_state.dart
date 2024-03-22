part of 'home_bloc.dart';

enum HomeStatus { idle, loading, success, failure }

class HomeState extends Equatable {
  final HomeStatus status;
  final List<ParkingSpaceModel> parkingSpaces;
  final Failure? failure;

  HomeState({
    required this.status,
    required this.parkingSpaces,
    this.failure,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<ParkingSpaceModel>? parkingSpaces,
    Failure? failure,
  }) {
    return HomeState(
      status: status ?? this.status,
      parkingSpaces: parkingSpaces ?? this.parkingSpaces,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [status];

  String get messageFailure => failure?.message ?? 'Nenhuma falha registrada!';
}
