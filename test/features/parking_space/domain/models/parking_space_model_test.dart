import 'package:flutter_test/flutter_test.dart';
import 'package:parking_lot_joao/features/parking_space/domain/models/parking_space_model.dart';

void main() {
  group('ParkingSpaceModel Test', () {
    test('ParkingSpaceModel should be instantiated correctly', () {
      final parkingSpace = ParkingSpaceModel(
        number: 1,
        occupied: true,
        startTime: DateTime(2024, 3, 13, 10, 0),
        endTime: DateTime(2024, 3, 13, 12, 0),
        comment: 'Regular visitor',
      );

      expect(parkingSpace.number, 1);

      expect(parkingSpace.occupied, true);
      expect(parkingSpace.startTime, DateTime(2024, 3, 13, 10, 0));
      expect(parkingSpace.endTime, DateTime(2024, 3, 13, 12, 0));
      expect(parkingSpace.comment, 'Regular visitor');
    });

    test('ParkingSpaceModel should be instantiated with null values correctly',
        () {
      final parkingSpace = ParkingSpaceModel(
        number: 1,
        occupied: true,
        startTime: null,
        endTime: null,
        comment: null,
      );

      expect(parkingSpace.startTime, isNull);
      expect(parkingSpace.endTime, isNull);
      expect(parkingSpace.comment, isNull);
    });

    test('ParkingSpaceModel toJson() and fromJson() should work correctly', () {
      final parkingSpace = ParkingSpaceModel(
        number: 1,
        occupied: true,
        startTime: DateTime(2024, 3, 13, 10, 0),
        endTime: DateTime(2024, 3, 13, 12, 0),
        comment: 'Regular visitor',
      );

      final jsonString = parkingSpace.toJson();
      final decodedParkingSpace = ParkingSpaceModel.fromJson(jsonString);

      expect(decodedParkingSpace.number, parkingSpace.number);
      expect(decodedParkingSpace.occupied, parkingSpace.occupied);
      expect(decodedParkingSpace.startTime, parkingSpace.startTime);
      expect(decodedParkingSpace.endTime, parkingSpace.endTime);
      expect(decodedParkingSpace.comment, parkingSpace.comment);
    });

    test(
        'ParkingSpaceModel copyWith() should create a copy with updated values',
        () {
      final parkingSpace = ParkingSpaceModel(
        number: 1,
        occupied: true,
        startTime: DateTime(2024, 3, 13, 10, 0),
        endTime: DateTime(2024, 3, 13, 12, 0),
        comment: 'Regular visitor',
      );

      final updatedParkingSpace = parkingSpace.copyWith(
        number: 2,
        occupied: false,
        startTime: DateTime(2024, 3, 13, 11, 0),
      );

      expect(updatedParkingSpace.number, 2);
      expect(updatedParkingSpace.occupied, false);
      expect(updatedParkingSpace.startTime, DateTime(2024, 3, 13, 11, 0));
      expect(updatedParkingSpace.endTime, parkingSpace.endTime);
      expect(updatedParkingSpace.comment, parkingSpace.comment);
    });
  });
}
