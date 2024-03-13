import 'package:parking_lot_joao/features/home/presentation/screens/home_screen.dart';

import 'package:flutter/material.dart';

class ParkingLotApp extends StatefulWidget {
  const ParkingLotApp({super.key});

  @override
  State<ParkingLotApp> createState() => _ParkingLotAppState();
}

class _ParkingLotAppState extends State<ParkingLotApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
