import 'package:parking_lot_joao/common/theme/theme_global.dart';
import 'package:parking_lot_joao/common/utils/app_navigator.dart';
import 'package:parking_lot_joao/features/home/presentation/screens/home_screen_teste.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AppNavigator _appNavigator;

  @override
  void initState() {
    _appNavigator = AppNavigator(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.blue,
        child: InkWell(
          onTap: () => _appNavigator.navigate(const HomeScreenTeste()),
          child: Center(
            child: Container(
              width: 100,
              height: 100,
              color: appColors.red,
            ),
          ),
        ),
      ),
    );
  }
}
