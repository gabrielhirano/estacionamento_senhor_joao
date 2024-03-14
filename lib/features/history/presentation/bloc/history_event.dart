part of 'history_bloc.dart';

abstract class HistoryEvent {}

class GetHistoryEvent extends HistoryEvent {}

class RecordHistoryInformationEvent extends HistoryEvent {
  final String information;

  RecordHistoryInformationEvent(this.information);
}
