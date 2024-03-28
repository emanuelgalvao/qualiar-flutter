import 'dart:convert';

import 'package:air_pollution_app/model/location_model.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationList with ChangeNotifier {
  List<LocationModel> _locations = [];

  List<LocationModel> get locations {
    return [..._locations];
  }

  int get count {
    return _locations.length;
  }

  setLocations(List<LocationModel> locations) {
    _locations = locations;
  }

  void addLocation(LocationModel location) {
    _locations.add(location);
    notifyListeners();
    _saveLocations();
  }

  void removeLocation(int locationId) {
    _locations.removeWhere(
      (location) => location.id == locationId,
    );
    notifyListeners();
    _saveLocations();
  }

  void handleFavorite(int locationId) {
    _locations.where((location) {
      return location.isFavorite;
    }).forEach((location) {
      location.isFavorite = false;
    });
    _locations.where((location) {
      return location.id == locationId;
    }).forEach((location) {
      location.isFavorite = true;
    });
    _saveLocations();
    notifyListeners();
  }

  _saveLocations() async {
    var preferences = await SharedPreferences.getInstance();
    var stringLocations = jsonEncode({
      'locations': _locations
    });
    preferences.setString('locations', stringLocations);
  }
}
