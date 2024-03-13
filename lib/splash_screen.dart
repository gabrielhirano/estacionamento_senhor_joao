import 'package:parking_lot_joao/common/theme/theme_global.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: appColors.colorBrandPrimaryBlue,
      child: Center(
          child: Image.asset(
        'assets/images/logo.png',
      )),
    );
  }
}
