import 'dart:io';

import 'package:parking_lot_joao/common/service/app_client.dart';
import 'package:parking_lot_joao/common/service/error/app_excepetion.dart';

import 'package:parking_lot_joao/features/parking_space/data/models/parking_space_model.dart';

abstract class ParkingSpaceRemoteDataSource {
  Future<List<ParkingSpaceModel>> getParkingSpace({String? number});
  Future createParkingSpace(ParkingSpaceModel parkingSpace);
  Future updateParkingSpace(ParkingSpaceModel parkingSpace);
  Future deleteParkingSpace(String idParking);
}

class ParkingSpaceRemoteDataSourceImpl extends ParkingSpaceRemoteDataSource {
  final AppClient client;

  ParkingSpaceRemoteDataSourceImpl(this.client);

  @override
  Future<List<ParkingSpaceModel>> getParkingSpace({String? number}) async {
    try {
      final response = await client.get('/spaces');

      // converter response apra lista de ParkingSpaceModel
      return [];
    } on SocketException {
      throw ServerExcepetion();
    }
  }

  @override
  Future createParkingSpace(ParkingSpaceModel parkingSpace) async {
    try {
      return client.post('/spaces', data: parkingSpace.toJson());
    } on SocketException {
      throw ServerExcepetion();
    }
  }

  @override
  Future updateParkingSpace(ParkingSpaceModel parkingSpace) async {
    try {
      return client.put('/spaces/${parkingSpace.number}',
          data: parkingSpace.toJson());
    } on SocketException {
      throw ServerExcepetion();
    }
  }

  @override
  Future deleteParkingSpace(String idParking) async {
    try {
      return client.delete('/spaces/$idParking');
    } on SocketException {
      throw ServerExcepetion();
    }
  }
}
