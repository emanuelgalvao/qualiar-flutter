import 'package:air_pollution_app/data/model/world_city_data.dart';
import 'package:air_pollution_app/features/world_cities/repository/world_cities_repository_interface.dart';

import '../../../data/api/air_pollution_api_interface.dart';

class WorldCitiesRepository extends IWorldCitiesRepository {

  final IAirPollutionApi airPollutionApi;

  WorldCitiesRepository({
    required this.airPollutionApi
  });

  @override
  Future<List<WorldCityData>> getWorldCitiesData() async {
    final worldCitiesData = await airPollutionApi.getWorldCitiesData();
    return worldCitiesData;
  }
  
}