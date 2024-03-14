part of 'history_bloc.dart';

enum HistoryStatus { loading, success, error }

class HistoryState {
  final HistoryStatus status;
  final List<String> history;
  final Exception? error;

  HistoryState({
    required this.status,
    required this.history,
    this.error,
  });

  HistoryState copyWith({
    HistoryStatus? status,
    List<String>? history,
    Exception? error,
  }) {
    return HistoryState(
      status: status ?? this.status,
      history: history ?? this.history,
      error: error ?? this.error,
    );
  }
}
