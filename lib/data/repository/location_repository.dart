import 'dart:convert';

import 'package:air_pollution_app/data/repository/location_repository_interface.dart';
import 'package:air_pollution_app/data/storage/local_storage_interface.dart';

import '../model/location_model.dart';
import 'default_locations.dart';

class LocationRepository extends ILocationRepository {
  final ILocalStorage storage;

  LocationRepository({required this.storage});

  @override
  Future<List<LocationModel>> getLocations() async {
    try {
      final savedLocations = json.decode(await storage.get('locations'));
      List<LocationModel> locations = [];
      savedLocations.forEach((location) {
        locations.add(LocationModel(
          id: location['id'],
          name: location['name'],
          uf: location['uf'],
          isFavorite: location['isFavorite'],
        ));
      });
      return locations;
    } catch (e) {
      return defaultLocations;
    }
  }

  @override
  Future<void> addLocation(LocationModel location) async {
    var locations = await getLocations();
    locations.add(location);
    storage.put('locations', json.encode(locations));
  }

  @override
  Future<void> removeLocation(int locationId) async {
    var locations = await getLocations();
    locations.removeWhere(
      (savedLocation) => savedLocation.id == locationId,
    );
    storage.put('locations', json.encode(locations));
  }

  @override
  Future<void> changeFavorite(int locationId) async {
    var locations = await getLocations();
    locations.where((savedLocation) {
      return savedLocation.isFavorite;
    }).forEach((savedLocation) {
      savedLocation.isFavorite = false;
    });
    locations.where((savedLocation) {
      return savedLocation.id == locationId;
    }).forEach((savedLocation) {
      savedLocation.isFavorite = true;
    });
    storage.put('locations', json.encode(locations));
  }

  @override
  Future<int> favoriteLocationId() async {
    final locations = await getLocations();
    return locations.where((location) => location.isFavorite).first.id;
  }

  @override
  Future<String> otherLocationsId() async {
    final locations = await getLocations();
    var otherLocationsString = "";
    locations.where((location) {
      return !location.isFavorite;
    }).forEach((location) {
      if (otherLocationsString.isNotEmpty) {
        otherLocationsString += ",";
      }
      otherLocationsString += location.id.toString();
    });
    return otherLocationsString;
  }
}
