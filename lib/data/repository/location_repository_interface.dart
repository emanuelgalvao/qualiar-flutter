import '../model/location_model.dart';

abstract class ILocationRepository {
  Future<List<LocationModel>> getLocations();
  Future<void> addLocation(LocationModel location);
  Future<void> removeLocation(int locationId);
  Future<void> changeFavorite(int locationId);
  Future<int> favoriteLocationId();
  Future<String> otherLocationsId();
}