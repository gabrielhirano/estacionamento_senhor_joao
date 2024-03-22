import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:parking_lot_joao/common/service/error/app_excepetion.dart';
import 'package:parking_lot_joao/common/service/error/app_failure.dart';
import 'package:parking_lot_joao/features/parking_space/data/data_source/parking_space_local_data_souce.dart';
import 'package:parking_lot_joao/features/parking_space/data/data_source/parking_space_remote_data_source.dart';
import 'package:parking_lot_joao/features/parking_space/data/models/parking_space_model.dart';
import 'package:parking_lot_joao/features/parking_space/domain/repositories/parking_space_repository.dart';

class ParkingSpaceRepositoryImpl implements ParkingSpaceRepository {
  final ParkingSpaceLocalDataSource _parkingSpaceLocalDataSource;
  final ParkingSpaceRemoteDataSource _parkingSpaceRemoteDataSource;

  ParkingSpaceRepositoryImpl(
    this._parkingSpaceLocalDataSource,
    this._parkingSpaceRemoteDataSource,
  );

  @override
  Future<List<ParkingSpaceModel>> getParkingSpaceModel({String? spaceNumber}) {
    return _parkingSpaceLocalDataSource
        .getParkingSpace(key: spaceNumber)
        .onError((error, stackTrace) {
      if (error is CacheException) {
        throw CacheFailure('Dados não econtrado.');
      }

      throw Failure(message: 'Erro desconhecido');
    });
  }

  @override
  Future setCheckIn(ParkingSpaceModel parkingSpace) {
    return _parkingSpaceLocalDataSource.updateParkingSpace(parkingSpace);
  }

  @override
  Future setCheckOut(ParkingSpaceModel parkingSpace) {
    return _parkingSpaceLocalDataSource.updateParkingSpace(parkingSpace);
  }

  @override
  Future clearParkingSpace(ParkingSpaceModel parkingSpace) {
    return _parkingSpaceLocalDataSource.updateParkingSpace(parkingSpace);
  }
}
