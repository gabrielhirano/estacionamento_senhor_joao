import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:parking_lot_joao/features/home/presentation/bloc/home_bloc.dart';

import 'package:parking_lot_joao/features/parking_space/domain/use_cases/clear_parking_space_use_case.dart';
import 'package:parking_lot_joao/features/parking_space/domain/use_cases/get_parking_spaces_use_case.dart';
import 'package:parking_lot_joao/features/parking_space/domain/use_cases/set_check_in_use_case.dart';
import 'package:parking_lot_joao/features/parking_space/domain/use_cases/set_check_out_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockGetParkingSpacesUseCase extends Mock
    implements GetParkingSpacesUseCase {}

class MockSetCheckInUseCase extends Mock implements SetCheckInUseCase {}

class MockSetCheckOutUseCase extends Mock implements SetCheckOutUseCase {}

class MockClearParkingSpaceUseCase extends Mock
    implements ClearParkingSpaceUseCase {}

void main() {
  group('HomeBloc', () {
    late HomeBloc bloc;
    late MockGetParkingSpacesUseCase mockGetParkingSpacesUseCase;
    late MockSetCheckInUseCase mockSetCheckInUseCase;
    late MockSetCheckOutUseCase mockSetCheckOutUseCase;
    late MockClearParkingSpaceUseCase mockClearParkingSpaceUseCase;

    setUp(() {
      mockGetParkingSpacesUseCase = MockGetParkingSpacesUseCase();
      mockSetCheckInUseCase = MockSetCheckInUseCase();
      mockSetCheckOutUseCase = MockSetCheckOutUseCase();
      mockClearParkingSpaceUseCase = MockClearParkingSpaceUseCase();
      bloc = HomeBloc(
        mockGetParkingSpacesUseCase,
        mockSetCheckInUseCase,
        mockSetCheckOutUseCase,
        mockClearParkingSpaceUseCase,
      );
    });

    blocTest<HomeBloc, HomeState>(
      'emits [loading, success] when GetParkingSpacesEvent is added and succeeds',
      setUp: () {
        when(() => mockGetParkingSpacesUseCase()).thenAnswer((_) async => []);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(GetParkingSpacesEvent()),
      expect: () => [
        HomeState(status: HomeStatus.loading, parkingSpaces: []),
        HomeState(status: HomeStatus.success, parkingSpaces: []),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [loading, failure] when GetParkingSpacesEvent is added and fails',
      setUp: () {
        when(() => mockGetParkingSpacesUseCase())
            .thenAnswer((_) async => throw Exception());
      },
      build: () => bloc,
      act: (bloc) => bloc.add(GetParkingSpacesEvent(spaceNumber: 100)),
      expect: () => [
        HomeState(status: HomeStatus.loading, parkingSpaces: []),
        HomeState(status: HomeStatus.failure, parkingSpaces: [], failure: null),
      ],
    );

    // Add more test cases for other events if needed
  });
}
