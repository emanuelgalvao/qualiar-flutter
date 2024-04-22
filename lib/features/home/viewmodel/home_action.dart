import 'package:flutter/widgets.dart';

sealed class HomeAction {}

class LoadData extends HomeAction {}

class GoToDetails extends HomeAction {
  final BuildContext context;
  final int locationId;

  GoToDetails({
    required this.context,
    required this.locationId
  });
}

class SwapTheme extends HomeAction {}