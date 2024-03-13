import 'package:parking_lot_joao/common/theme/theme_global.dart';
import 'package:parking_lot_joao/common/util/app_navigator.dart';
import 'package:flutter/material.dart';

class HomeScreenTeste extends StatefulWidget {
  const HomeScreenTeste({super.key});

  @override
  State<HomeScreenTeste> createState() => _HomeScreenTesteState();
}

class _HomeScreenTesteState extends State<HomeScreenTeste> {
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
        color: Colors.black,
        child: InkWell(
          onTap: () => _appNavigator.popNavigate(),
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
