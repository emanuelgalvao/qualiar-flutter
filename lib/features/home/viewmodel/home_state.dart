import 'package:flutter/widgets.dart';

import '../../../data/model/home_data.dart';

sealed class HomeState {
  late IconData toolbarIcon;
}

class Loading extends HomeState {
  IconData toolbarIcon;

  Loading({
    required this.toolbarIcon
  });
}

class Reender extends HomeState {
  IconData toolbarIcon;
  final HomeData data;

  Reender({
    required this.toolbarIcon,
    required this.data,
  });
}