import 'package:flutter/widgets.dart';

sealed class AddLocationAction {}

class ChooseState extends AddLocationAction {
  final BuildContext context;

  ChooseState({required this.context});
}

class ChooseCity extends AddLocationAction {
  final BuildContext context;

  ChooseCity({required this.context});
}

class AddLocation extends AddLocationAction {
  final BuildContext context;

  AddLocation({required this.context});
}