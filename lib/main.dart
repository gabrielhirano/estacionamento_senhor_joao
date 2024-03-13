import 'package:parking_lot_joao/common/config/dependency_injection.dart';
import 'package:parking_lot_joao/features/home/presentation/screens/home_screen.dart';
import 'package:parking_lot_joao/splash_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const SplashScreen());

  await DependencyInjection.init();

  runApp(const HomeScreen());
}
