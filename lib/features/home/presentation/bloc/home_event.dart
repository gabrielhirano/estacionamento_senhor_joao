part of 'home_bloc.dart';

abstract class HomeEvent {}

class GetParkingSpacesEvent extends HomeEvent {
  final int? spaceNumber;

  GetParkingSpacesEvent({this.spaceNumber});
}

class SetCheckInEvent extends HomeEvent {
  final ParkingSpaceModel parkingSpace;

  SetCheckInEvent({required this.parkingSpace});
}

class SetCheckOutEvent extends HomeEvent {
  final ParkingSpaceModel parkingSpace;

  SetCheckOutEvent({required this.parkingSpace});
}

class ClearParkingSpaceEvent extends HomeEvent {
  final ParkingSpaceModel parkingSpace;

  ClearParkingSpaceEvent(this.parkingSpace);
}
