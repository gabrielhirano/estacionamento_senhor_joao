import 'package:parking_lot_joao/common/config/dependency_injection.dart';
import 'package:parking_lot_joao/common/layout/components/app_text.dart';

import 'package:parking_lot_joao/common/theme/theme_global.dart';
import 'package:parking_lot_joao/common/util/app_navigator.dart';
import 'package:parking_lot_joao/common/util/aspect_ratio_util.dart';
import 'package:parking_lot_joao/common/widget/grid_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:parking_lot_joao/common/widget/loading/skeleton_grid_widget.dart';
import 'package:parking_lot_joao/common/widget/loading/skeleton_widget.dart';
import 'package:parking_lot_joao/features/history/presentation/bloc/history_bloc.dart';
import 'package:parking_lot_joao/features/history/presentation/widgets/history_preview_widget.dart';
import 'package:parking_lot_joao/features/history/util/history_formatter.dart';
import 'package:parking_lot_joao/features/home/presentation/bloc/home_bloc.dart';
import 'package:parking_lot_joao/features/parking_space/domain/models/parking_space_model.dart';
import 'package:parking_lot_joao/features/parking_space/presentation/widgets/card_parking_space_widget.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeBloc = getIt<HomeBloc>();
  final _historyBloc = getIt<HistoryBloc>();

  late AppNavigator _appNavigator;

  @override
  void initState() {
    _appNavigator = AppNavigator(context);

    _homeBloc.add(GetParkingSpacesEvent());
    _historyBloc.add(GetHistoryEvent());

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
              BlocBuilder<HistoryBloc, HistoryState>(
                bloc: _historyBloc,
                builder: (context, state) => switch (state.status) {
                  HistoryStatus.loading =>
                    const SkeletonWidget(height: 100, radius: 8),
                  HistoryStatus.success =>
                    HistoryPreviewWidget(history: state.history),
                  HistoryStatus.error => SizedBox.fromSize(),
                },
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
    _historyBloc.add(RecordHistoryInformationEvent('${DateTime.now()}'));
    _historyBloc.add(GetHistoryEvent());

    _homeBloc.add(ClearParkingSpaceEvent(
      ParkingSpaceModel.empty(number: parkingSpace.number),
    ));

    _homeBloc.add(GetParkingSpacesEvent());
  }
}
