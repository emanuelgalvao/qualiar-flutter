import 'dart:convert';

import 'package:air_pollution_app/model/home_data.dart';
import 'package:air_pollution_app/model/location_model.dart';
import 'package:air_pollution_app/utils/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AirPollutionData with ChangeNotifier {
  HomeData? _homeData;
  DetailsData? _detailsData;

  int? _selectedLocation;

  int? get selectedLocation {
    return _selectedLocation;
  }

  void selectLocation(id) {
    _selectedLocation = id;
  }

  HomeData? get homeData {
    return _homeData;
  }

  DetailsData? get detailsData {
    return _detailsData;
  }

  Future<void> getHomeData(List<LocationModel> locations) async {
    final favoriteLocationId =
        locations.where((location) => location.isFavorite).firstOrNull?.id;
    final otherLocations = locations
        .where((location) => !location.isFavorite)
        .map((location) => location.id);

    var otherLocationsString = "";

    for (var location in otherLocations) {
      if (otherLocationsString.isNotEmpty) {
        otherLocationsString += ",";
      }
      otherLocationsString += location.toString();
    }
    final url =
        "${Endpoints.homeData}?favoriteLocationId=${favoriteLocationId}&otherLocationsId=${otherLocationsString}";
    print(url);
    final response = await http.get(Uri.parse(url));
    final responseJson = await jsonDecode(response.body);

    final favoriteLocation = responseJson['favoriteLocation'];

    _homeData = HomeData(
      favoriteLocation: FavoriteLocationHomeData(
        city: CityData(
          id: favoriteLocation['city']['id'],
          name: favoriteLocation['city']['city'],
          uf: favoriteLocation['city']['uf'],
        ),
        values: ValuesData(
          current:
              double.parse(favoriteLocation['values']['current'].toString()),
          min: double.parse(favoriteLocation['values']['min'].toString()),
          max: double.parse(favoriteLocation['values']['max'].toString()),
        ),
        nextDays: (favoriteLocation['nextDays'] as List)
            .map((day) => DaysData(day: day['day'], value: (double.tryParse(day['value'].toString()) ?? 0.0)))
            .toList(),
      ),
      otherLocations: (responseJson['otherLocations'] as List)
          .map((location) => OtherLocationHomeData(
              id: location['id'],
              name: location['city'],
              uf: location['uf'],
              value: double.parse(location['value'].toString())))
          .toList(),
    );
    notifyListeners();
  }

  Future<void> getDetailsData(int id) async {
    final response = await http
        .get(Uri.parse(Endpoints.detailsData.replaceAll(":id", id.toString())));
        print(Endpoints.detailsData.replaceAll(":id", id.toString()));
    final responseJson = await jsonDecode(response.body);

    _detailsData = DetailsData(
      city: CityData(
        id: responseJson['city']['id'],
        name: responseJson['city']['city'],
        uf: responseJson['city']['uf'],
      ),
      values: ValuesData(
        current: double.parse(responseJson['values']['current'].toString()),
        min: double.parse(responseJson['values']['min'].toString()),
        max: double.parse(responseJson['values']['max'].toString()),
      ),
      previousDays: (responseJson['previousDays'] as List)
          .map((day) => DaysData(day: day['day'], value: day['value']))
          .toList(),
      nextDays: (responseJson['nextDays'] as List)
          .map((day) => DaysData(day: day['day'], value: (double.tryParse(day['value'].toString()) ?? 0.0)))
          .toList(),
    );
    notifyListeners();
  }
}
