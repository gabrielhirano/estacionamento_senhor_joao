import 'package:parking_lot_joao/common/theme/theme_global.dart';
import 'package:parking_lot_joao/common/util/app_navigator.dart';
import 'package:parking_lot_joao/common/util/aspect_ratio_util.dart';
import 'package:parking_lot_joao/common/widget/loading/skeleton_grid_widget.dart';
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
      body: InkWell(
        onTap: () => _appNavigator.navigate(const HomeScreenTeste()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SkeletonGridWidget(
            amount: 21,
            radius: 8,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: AspectRatioUtil.calculateAspectRatio(
                context,
                crossAxisSpacing: 14,
                crossAxisCount: 2,
                height: 180,
              ),
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
            ),
          ),
        ),
      ),
    );
  }
}
