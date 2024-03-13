import 'package:estacionamento_senhor_joao/common/config/dependency_injection.dart';
import 'package:estacionamento_senhor_joao/features/home/presentation/screens/home_screen.dart';
import 'package:estacionamento_senhor_joao/splash_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const SplashScreen());

  await DependencyInjection.init();

  runApp(const HomeScreen());
}
