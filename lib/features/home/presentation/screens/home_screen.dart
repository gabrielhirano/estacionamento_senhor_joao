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
import 'package:parking_lot_joao/common/widget/loading/skeleton_grid_widget.dart';
import 'package:parking_lot_joao/features/home/presentation/bloc/home_bloc.dart';
import 'package:parking_lot_joao/features/parking_space/domain/models/parking_space_model.dart';
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
                  HomeStatus.loading => _loadingStateGrid(),
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

  Widget _loadingStateGrid() {
    return SkeletonGridWidget(
      amount: 21,
      radius: 8,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: AspectRatioUtil.calculateAspectRatio(
          context,
          crossAxisSpacing: 14,
          crossAxisCount: 3,
          height: 100,
        ),
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
      ),
    );
  }

  Widget _sucessStateGrid(HomeState state) {
    print(state);
    return GridWiget(
      itemCount: state.parkingSpaces.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: AspectRatioUtil.calculateAspectRatio(
          context,
          crossAxisSpacing: 14,
          crossAxisCount: 3,
          height: 100,
        ),
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
      ),
      itemBuilder: (_, index) {
        final parkingSpace = state.parkingSpaces[index];

        return CardParkingSpaceWidget(
          parkingSpace: parkingSpace,
          checkIn: () => _onCheckIn(parkingSpace),
          checkOut: () => _onCheckOut(parkingSpace),
        );
      },
    );
  }

  void _onCheckIn(ParkingSpaceModel parkingSpace) {
    final parkingSpaceCheckIn =
        parkingSpace.copyWith(startTime: DateTime.now());

    _homeBloc.add(SetCheckInEvent(parkingSpace: parkingSpaceCheckIn));
    _homeBloc.add(GetParkingSpacesEvent());
  }

  void _onCheckOut(ParkingSpaceModel parkingSpace) {
    final parkingSpaceCheckOut = parkingSpace.copyWith(endTime: DateTime.now());

    _homeBloc.add(SetCheckOutEvent(parkingSpace: parkingSpaceCheckOut));
    // adicionar ao historico
    _homeBloc.add(ClearParkingSpaceEvent(
      ParkingSpaceModel.empty(number: parkingSpace.number),
    ));

    _homeBloc.add(GetParkingSpacesEvent());
  }
}
