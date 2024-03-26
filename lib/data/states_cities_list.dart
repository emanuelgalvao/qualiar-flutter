import 'dart:convert';

import 'package:air_pollution_app/model/city_model.dart';
import 'package:air_pollution_app/model/state_model.dart';
import 'package:air_pollution_app/utils/endpoints.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class StatesCitiesList with ChangeNotifier {
  final List<StateModel> _states = [];
  final List<CityModel> _cities = [];

  List<StateModel> get states {
    return [..._states];
  }

  List<CityModel> get cities {
    return [..._cities];
  }

  void clearCities() {
    _cities.clear();
    notifyListeners();
  }

  Future<void> loadStates() async {
    final response = await http.get(Uri.parse(Endpoints.states));

    _states.clear();
    final body = jsonDecode(response.body);
    body.forEach((state) {
      _states.add(StateModel(name: state['name'], uf: state['uf']));
    });
    notifyListeners();
  }

  Future<void> loadCitiesFromState(String uf) async {
    final response =
        await http.get(Uri.parse(Endpoints.cities.replaceAll(":uf", uf)));

    _cities.clear();
    final body = jsonDecode(response.body);
    body.forEach((city) {
      _cities.add(CityModel(
        id: city['id'],
        name: city['name'],
      ));
    });
    notifyListeners();
  }
}
