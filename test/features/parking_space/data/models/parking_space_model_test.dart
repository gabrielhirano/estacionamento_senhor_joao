import 'package:test/test.dart';
import 'package:parking_lot_joao/features/parking_space/data/models/parking_space_model.dart';

void main() {
  group('ParkingSpaceModel', () {
    test(
        'isOccupied should return true when startTime is not null and endTime is null',
        () {
      final parkingSpace = ParkingSpaceModel(
        number: 1,
        startTime: DateTime.now(),
      );

      expect(parkingSpace.isOccupied, isTrue);
    });

    test('isOccupied should return false when startTime is null', () {
      final parkingSpace = ParkingSpaceModel(
        number: 1,
      );

      expect(parkingSpace.isOccupied, isFalse);
    });

    test('isOccupied should return false when endTime is not null', () {
      final parkingSpace = ParkingSpaceModel(
        number: 1,
        endTime: DateTime.now(),
      );

      expect(parkingSpace.isOccupied, isFalse);
    });

    test('isFree should return true when startTime and endTime are null', () {
      final parkingSpace = ParkingSpaceModel(
        number: 1,
      );

      expect(parkingSpace.isFree, isTrue);
    });

    test('isFree should return false when startTime is not null', () {
      final parkingSpace = ParkingSpaceModel(
        number: 1,
        startTime: DateTime.now(),
      );

      expect(parkingSpace.isFree, isFalse);
    });

    test('isFree should return false when endTime is not null', () {
      final parkingSpace = ParkingSpaceModel(
        number: 1,
        endTime: DateTime.now(),
      );

      expect(parkingSpace.isFree, isFalse);
    });

    test('log should return correct log string when parking space is occupied',
        () {
      final startTime = DateTime(2022, 10, 20, 10, 30);
      final parkingSpace = ParkingSpaceModel(
        number: 1,
        startTime: startTime,
      );

      expect(
        parkingSpace.log,
        equals('[20/10/2022 10:30]  Entrou na vaga 1'),
      );
    });

    test('log should return correct log string when parking space is free', () {
      final endTime = DateTime(2022, 10, 20, 10, 30);
      final parkingSpace = ParkingSpaceModel(number: 1, endTime: endTime);

      expect(
        parkingSpace.log,
        equals('[20/10/2022 10:30]  Saiu da vaga 1'),
      );
    });

    test(
        'copyWith should return a new instance with the specified properties updated',
        () {
      final parkingSpace = ParkingSpaceModel(
        number: 1,
        occupied: true,
        startTime: DateTime(2022, 10, 20, 10, 30),
        endTime: DateTime(2022, 10, 20, 12, 30),
        comment: 'Test comment',
      );

      final updatedParkingSpace = parkingSpace.copyWith(
        number: 2,
        occupied: false,
        startTime: DateTime(2022, 10, 21, 8, 0),
        endTime: DateTime(2022, 10, 21, 10, 0),
        comment: 'Updated comment',
      );

      expect(updatedParkingSpace.number, equals(2));
      expect(updatedParkingSpace.occupied, isFalse);
      expect(
          updatedParkingSpace.startTime, equals(DateTime(2022, 10, 21, 8, 0)));
      expect(
          updatedParkingSpace.endTime, equals(DateTime(2022, 10, 21, 10, 0)));
      expect(updatedParkingSpace.comment, equals('Updated comment'));
    });

    test('toMap should return correct map representation', () {
      final startTime = DateTime(2022, 10, 20, 10, 30);
      final endTime = DateTime(2022, 10, 20, 12, 30);

      final parkingSpace = ParkingSpaceModel(
        number: 1,
        occupied: true,
        startTime: startTime,
        endTime: endTime,
        comment: 'Test comment',
      );

      final map = parkingSpace.toMap();

      expect(map['number'], equals(1));
      expect(map['occupied'], isTrue);
      expect(map['startTime'], equals(startTime.millisecondsSinceEpoch));
      expect(map['endTime'], equals(endTime.millisecondsSinceEpoch));
      expect(map['comment'], equals('Test comment'));
    });

    test('fromJson should return correct ParkingSpaceModel instance', () {
      // passar maps para json dar um decode do arquivo usando fixture reader
      final startTime = DateTime(2022, 10, 20, 10, 30);
      final endTime = DateTime(2022, 10, 20, 12, 30);

      final map = {
        'number': 1,
        'occupied': true,
        'startTime': startTime.millisecondsSinceEpoch,
        'endTime': endTime.millisecondsSinceEpoch,
        'comment': 'Test comment',
      };

      final parkingSpace = ParkingSpaceModel.fromMap(map);

      expect(parkingSpace.number, equals(1));
      expect(parkingSpace.occupied, isTrue);
      expect(parkingSpace.startTime, equals(startTime));
      expect(parkingSpace.endTime, equals(endTime));
      expect(parkingSpace.comment, equals('Test comment'));
    });
  });
}
