import 'package:air_pollution_app/data/api/air_pollution_api_interface.dart';
import 'package:air_pollution_app/data/repository/location_repository_interface.dart';
import 'package:air_pollution_app/data/model/city_model.dart';
import 'package:air_pollution_app/data/model/location_model.dart';
import 'package:air_pollution_app/data/model/state_model.dart';
import 'package:air_pollution_app/features/add_location/repository/add_location_repository_interface.dart';

class AddLocationRepository extends IAddLocationRepository {

  final IAirPollutionApi airPollutionApi;
  final ILocationRepository locationRepository;

  AddLocationRepository({required this.airPollutionApi, required this.locationRepository});
  
  @override
  Future<List<StateModel>> getStates() async {
    final states = await airPollutionApi.getStates();
    return states;
  }
  
  @override
  Future<List<CityModel>> getCitiesFromState(String uf) async {
    final cities = await airPollutionApi.getCitiesFromState(uf);
    return cities;
  }

  @override
  Future<void> saveLocation(LocationModel location) async {
    await locationRepository.addLocation(location);
  }
}