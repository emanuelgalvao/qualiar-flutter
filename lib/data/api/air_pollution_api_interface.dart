import 'package:air_pollution_app/data/model/details_data.dart';
import 'package:air_pollution_app/data/model/home_data.dart';

import '../model/city_model.dart';
import '../model/state_model.dart';
import '../model/world_city_data.dart';

abstract class IAirPollutionApi {
  Future<List<StateModel>> getStates();
  Future<List<CityModel>> getCitiesFromState(String uf);
  Future<HomeData> getHomeData(int favoriteLocationId, String otherLocationsId);
  Future<DetailsData> getDetailsData(int locationId);
  Future<List<WorldCityData>> getWorldCitiesData();
}