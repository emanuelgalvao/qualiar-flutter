import 'package:flutter/widgets.dart';

sealed class WorldCitiesAction {}

class LoadData extends WorldCitiesAction {}

class GoToDetails extends WorldCitiesAction {
  final BuildContext context;
  final int id;

  GoToDetails({
    required this.context,
    required this.id
  });
}