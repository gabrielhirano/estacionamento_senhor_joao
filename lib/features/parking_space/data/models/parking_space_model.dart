import 'dart:convert';

import 'package:intl/intl.dart';

class ParkingSpaceModel {
  final int number;

  final bool occupied;

  final DateTime? startTime;
  final DateTime? endTime;

  final String? comment;

  ParkingSpaceModel({
    required this.number,
    this.occupied = false,
    this.startTime,
    this.endTime,
    this.comment,
  });
  bool get isOccupied => startTime != null && endTime == null;

  bool get isFree => startTime == null && endTime == null;

  String get log {
    if (startTime != null && isOccupied) {
      final time = DateFormat('dd/MM/yyyy HH:mm').format(startTime!);

      return '[$time]  Entrou na vaga $number';
    } else {
      final time = DateFormat('dd/MM/yyyy HH:mm').format(endTime!);

      return '[$time]  Saiu da vaga $number';
    }
  }

  ParkingSpaceModel copyWith({
    int? number,
    bool? occupied,
    DateTime? startTime,
    DateTime? endTime,
    String? comment,
  }) {
    return ParkingSpaceModel(
      number: number ?? this.number,
      occupied: occupied ?? this.occupied,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      comment: comment ?? this.comment,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'number': number,
      'occupied': occupied,
      'startTime': startTime?.millisecondsSinceEpoch,
      'endTime': endTime?.millisecondsSinceEpoch,
      'comment': comment,
    };
  }

  factory ParkingSpaceModel.empty({required int number}) =>
      ParkingSpaceModel(number: number);

  factory ParkingSpaceModel.fromMap(Map<String, dynamic> map) {
    return ParkingSpaceModel(
      number: map['number'] as int,
      occupied: map['occupied'] as bool,
      startTime: map['startTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['startTime'] as int)
          : null,
      endTime: map['endTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['endTime'] as int)
          : null,
      comment: map['comment'] != null ? map['comment'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ParkingSpaceModel.fromJson(String source) =>
      ParkingSpaceModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
