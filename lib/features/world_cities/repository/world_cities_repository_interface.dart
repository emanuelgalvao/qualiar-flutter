import 'package:air_pollution_app/data/model/world_city_data.dart';

abstract class IWorldCitiesRepository {

  Future<List<WorldCityData>> getWorldCitiesData();
}