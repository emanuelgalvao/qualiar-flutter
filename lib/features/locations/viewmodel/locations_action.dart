import 'package:air_pollution_app/data/model/location_model.dart';
import 'package:flutter/widgets.dart';

sealed class LocationsAction {}

class LoadData extends LocationsAction {}

class ChooseFavorite extends LocationsAction {
  final int locationId;
  ChooseFavorite({required this.locationId});
}

class Remove extends LocationsAction {
  final BuildContext context;
  final LocationModel location;

  Remove({
    required this.context,
    required this.location,
  });
}

class GoToAddLocation extends LocationsAction {
  final BuildContext context;
  GoToAddLocation({required this.context});
}
