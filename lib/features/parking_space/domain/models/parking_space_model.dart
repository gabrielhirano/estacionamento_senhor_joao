import 'dart:convert';

class ParkingSpaceModel {
  final int number;
  final String licensePlate;
  final bool occupied;

  final DateTime? startTime;
  final DateTime? endTime;

  final String? comment;

  ParkingSpaceModel({
    required this.number,
    required this.licensePlate,
    required this.occupied,
    required this.startTime,
    required this.endTime,
    this.comment,
  });

  ParkingSpaceModel copyWith({
    int? number,
    String? licensePlate,
    bool? occupied,
    DateTime? startTime,
    DateTime? endTime,
    String? comment,
  }) {
    return ParkingSpaceModel(
      number: number ?? this.number,
      licensePlate: licensePlate ?? this.licensePlate,
      occupied: occupied ?? this.occupied,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      comment: comment ?? this.comment,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'number': number,
      'licensePlate': licensePlate,
      'occupied': occupied,
      'startTime': startTime?.millisecondsSinceEpoch,
      'endTime': endTime?.millisecondsSinceEpoch,
      'comment': comment,
    };
  }

  factory ParkingSpaceModel.fromMap(Map<String, dynamic> map) {
    return ParkingSpaceModel(
      number: map['number'] as int,
      licensePlate: map['licensePlate'] as String,
      occupied: map['occupied'] as bool,
      startTime: DateTime.fromMillisecondsSinceEpoch(map['startTime'] as int),
      endTime: DateTime.fromMillisecondsSinceEpoch(map['endTime'] as int),
      comment: map['comment'] != null ? map['comment'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ParkingSpaceModel.fromJson(String source) =>
      ParkingSpaceModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
