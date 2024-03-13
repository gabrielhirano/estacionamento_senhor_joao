// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

enum HomeStatus { idle, loading, success, error }

class HomeState {
  final HomeStatus status;
  final List<ParkingSpaceModel> parkingSpaces;
  final Exception? error;

  HomeState({
    required this.status,
    required this.parkingSpaces,
    this.error,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<ParkingSpaceModel>? parkingSpaces,
    Exception? error,
  }) {
    return HomeState(
      status: status ?? this.status,
      parkingSpaces: parkingSpaces ?? this.parkingSpaces,
      error: error ?? this.error,
    );
  }
}
