import 'package:air_pollution_app/model/location_model.dart';
import 'package:flutter/foundation.dart';

class LocationList with ChangeNotifier {

  final List<LocationModel> _locations = [
    LocationModel(
      id: 3266,
      name: 'Curitiba',
      uf: 'PR',
      isFavorite: true,
    ),
    LocationModel(
      id: 5296,
      name: 'São Paulo',
      uf: 'SP',
    ),
  ];

  List<LocationModel> get locations {
    return [..._locations];
  }

  int get count {
    return _locations.length;
  }

  void addLocation(LocationModel location) {
    _locations.add(location);
    notifyListeners();
  }

  void removeLocation(int locationId) {
    
    _locations.removeWhere(
      (location) => location.id == locationId,
    );
    notifyListeners();
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
    notifyListeners();
  }
}
