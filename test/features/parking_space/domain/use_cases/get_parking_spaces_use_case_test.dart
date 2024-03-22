import 'package:flutter_test/flutter_test.dart';
import 'package:parking_lot_joao/features/parking_space/data/models/parking_space_model.dart';
import 'package:parking_lot_joao/features/parking_space/domain/repositories/parking_space_repository.dart';
import 'package:parking_lot_joao/features/parking_space/domain/use_cases/get_parking_spaces_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockParkingSpaceRepository extends Mock
    implements ParkingSpaceRepository {}

void main() {
  late GetParkingSpacesUseCase useCase;
  late MockParkingSpaceRepository mockRepository;

  setUp(() {
    mockRepository = MockParkingSpaceRepository();
    useCase = GetParkingSpacesUseCase(mockRepository);
  });

  group('call', () {
    test('should return list of parking spaces from repository', () async {
      final spaceNumber = '1';
      final parkingSpaces = [ParkingSpaceModel(number: 1)];

      when(() => mockRepository.getParkingSpaceModel(spaceNumber: spaceNumber))
          .thenAnswer((_) async => parkingSpaces);

      final result = await useCase.call(spaceNumber: spaceNumber);

      expect(result, parkingSpaces);
    });
  });
}
