import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:parking_lot_joao/common/config/dependency_injection.dart';
import 'package:parking_lot_joao/common/layout/components/app_text.dart';
import 'package:parking_lot_joao/common/layout/foundation/app_shapes.dart';
import 'package:parking_lot_joao/common/theme/theme_global.dart';
import 'package:parking_lot_joao/common/util/app_navigator.dart';
import 'package:parking_lot_joao/common/util/aspect_ratio_util.dart';
import 'package:parking_lot_joao/common/widget/grid_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:parking_lot_joao/common/widget/loading/skeleton_list_widget.dart';
import 'package:parking_lot_joao/features/home/presentation/bloc/home_bloc.dart';
import 'package:parking_lot_joao/features/parking_space/presentation/widgets/card_parking_space_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc _homeBloc = getIt<HomeBloc>();
  late AppNavigator _appNavigator;

  @override
  void initState() {
    _appNavigator = AppNavigator(context);
    _homeBloc.add(GetParkingSpacesEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: 'Estacionamento',
          textStyle: AppTextStyle.paragraphLargeBold,
          textColor: appColors.colorBrandPrimaryBlue,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                decoration: AppShapes.decoration(
                  radius: RadiusSize.small,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<HomeBloc, HomeState>(
                bloc: _homeBloc,
                builder: (context, state) => switch (state.status) {
                  HomeStatus.idle => SizedBox.fromSize(),
                  HomeStatus.loading => const SkeletonListWidget(
                      amount: 10,
                      height: 80,
                      radius: 4,
                      margin: EdgeInsets.only(bottom: 10),
                    ),
                  HomeStatus.success => _sucessStateGrid(state),
                  HomeStatus.error => SizedBox.fromSize(),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sucessStateGrid(HomeState state) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(
        state.parkingSpaces.length,
        (index) {
          final parkingSpace = state.parkingSpaces[index];

          return CardParkingSpaceWidget(parkingSpace: parkingSpace);
        },
      ).toList(),
    );
  }
}
