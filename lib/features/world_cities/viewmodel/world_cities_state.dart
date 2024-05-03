import 'package:air_pollution_app/data/model/world_city_data.dart';

sealed class WorldCitiesState {}

class Loading extends WorldCitiesState {}

class Reender extends WorldCitiesState {
  final List<WorldCityData> data;
  Reender({
    required this.data,
  });
}