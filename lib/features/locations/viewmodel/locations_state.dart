import '../../../data/model/location_model.dart';

sealed class LocationsState {}

class Loading extends LocationsState {}

class Show extends LocationsState {
  final List<LocationModel> data;
  final bool showMaxLocationsDialog;
  Show({
    required this.data,
    required this.showMaxLocationsDialog,
  });
}
