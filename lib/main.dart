import 'package:parking_lot_joao/common/config/dependency_injection.dart';

import 'package:parking_lot_joao/features/splash/presentation/screens/splash_screen.dart';

import 'package:parking_lot_joao/common/config/parking_app.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const SplashScreen());

  await DependencyInjection.init();

  runApp(const ParkingLotApp());
}
