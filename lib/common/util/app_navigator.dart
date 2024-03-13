import 'package:flutter/material.dart';

class AppNavigator {
  final BuildContext context;
  AppNavigator(this.context);

  void navigate(dynamic destination) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => destination,
          fullscreenDialog: false,
          maintainState: false),
    );
  }

  void popNavigate() => Navigator.pop(context);

  void popToRoot() => Navigator.popUntil(context, (route) => route.isFirst);
}
