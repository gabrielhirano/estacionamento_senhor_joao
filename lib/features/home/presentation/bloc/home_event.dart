part of 'home_bloc.dart';

abstract class HomeEvent {}

class GetParkingSpacesEvent extends HomeEvent {
  final int? spaceNumber;

  GetParkingSpacesEvent({this.spaceNumber});
}
