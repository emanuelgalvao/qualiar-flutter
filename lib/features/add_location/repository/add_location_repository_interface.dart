import 'package:air_pollution_app/data/model/city_model.dart';
import 'package:air_pollution_app/data/model/location_model.dart';
import 'package:air_pollution_app/data/model/state_model.dart';

abstract class IAddLocationRepository {
  Future<List<StateModel>> getStates();
  Future<List<CityModel>> getCitiesFromState(String uf);
  Future<void> saveLocation(LocationModel location);
}