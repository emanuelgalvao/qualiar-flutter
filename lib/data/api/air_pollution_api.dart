import 'dart:convert';

import 'package:air_pollution_app/data/api/air_pollution_api_interface.dart';
import 'package:air_pollution_app/data/model/details_data.dart';
import 'package:air_pollution_app/data/model/home_data.dart';
import 'package:http/http.dart' as http;

import '../../core/util/endpoints.dart';
import '../model/city_data.dart';
import '../model/city_model.dart';
import '../model/days_data.dart';
import '../model/state_model.dart';
import '../model/values_data.dart';

class AirPollutionApi extends IAirPollutionApi {
  @override
  Future<List<StateModel>> getStates() async {
    final response = await http.get(Uri.parse(Endpoints.states));
    final List<StateModel> states = [];
    final body = jsonDecode(response.body);
    body.forEach((state) {
      states.add(
        StateModel(
          name: state['name'],
          uf: state['uf'],
        ),
      );
    });
    return states;
  }

  @override
  Future<List<CityModel>> getCitiesFromState(String uf) async {
    final response = await http.get(Uri.parse(Endpoints.cities.replaceAll(":uf", uf)));
    final List<CityModel> cities = [];
    final body = jsonDecode(response.body);
    body.forEach((city) {
      cities.add(CityModel(
        id: city['id'],
        name: city['name'],
      ));
    });
    return cities;
  }

  @override
  Future<HomeData> getHomeData(int favoriteLocationId, String otherLocationsId) async {
    final url =
        "${Endpoints.homeData}?favoriteLocationId=${favoriteLocationId}&otherLocationsId=${otherLocationsId}";
    final response = await http.get(Uri.parse(url));
    final responseJson = await jsonDecode(response.body);
    return HomeData.fromJson(responseJson);
  }

  @override
  Future<DetailsData> getDetailsData(int locationId) async {
    final response = await http
        .get(Uri.parse(Endpoints.detailsData.replaceAll(":id", locationId.toString())));
    final responseJson = await jsonDecode(response.body);
    return DetailsData(
      city: CityData(
        id: responseJson['city']['id'],
        name: responseJson['city']['name'],
        uf: responseJson['city']['uf'],
      ),
      values: ValuesData(
        current: double.parse(responseJson['values']['current'].toString()),
        min: double.parse(responseJson['values']['min'].toString()),
        max: double.parse(responseJson['values']['max'].toString()),
      ),
      previousDays: (responseJson['previousDays'] as List)
          .map((day) => DaysData(day: day['day'], value: double.tryParse(day['value'].toString()) ?? 0.0))
          .toList(),
      nextDays: (responseJson['nextDays'] as List)
          .map((day) => DaysData(day: day['day'], value: (double.tryParse(day['value'].toString()) ?? 0.0)))
          .toList(),
    );
  }
}
