import 'package:air_pollution_app/data/repository/location_repository_interface.dart';
import 'package:air_pollution_app/data/model/location_model.dart';
import 'package:air_pollution_app/features/locations/viewmodel/locations_action.dart';
import 'package:air_pollution_app/features/locations/viewmodel/locations_state.dart';
import 'package:flutter/material.dart';

import '../../../core/util/app_routes.dart';
import '../../../core/shared/dialog/show_dialog.dart';

class LocationsViewModel {
  final ILocationRepository locationRepository;

  ValueNotifier<LocationsState> state = ValueNotifier(Loading());

  LocationsViewModel({
    required this.locationRepository,
  }) {
    handleAction(LoadData());
  }

  void handleAction(LocationsAction action) {
    switch (action) {
      case LoadData():
        _loadData();
      case ChooseFavorite():
        _chooseFavorite(action.locationId);
      case Remove():
        _remove(action.context, action.location);
      case GoToAddLocation():
        _goToAddLocation(action.context);
    }
  }

  void _loadData() async {
    final locations = await locationRepository.getLocations();
    state.value = Show(
      data: locations,
      showMaxLocationsDialog: locations.length >= 5,
    );
  }

  void _chooseFavorite(int locationId) async {
    state.value = Loading();
    await locationRepository.changeFavorite(locationId);
    _loadData();
  }

  void _remove(BuildContext context, LocationModel location) async {
    if (location.isFavorite) {
      showAdaptativeDialog(
        context,
        'Erro ao excluir!',
        'Você não pode excluir seu local favorito!\nEscolha outro local como favorito antes de exluir esse!',
      );
    } else {
      state.value = Loading();
      await locationRepository.removeLocation(location.id);
      _loadData();
    }
  }

  void _goToAddLocation(BuildContext context) {
    if ((state.value as Show).data.length >= 5) {
      showAdaptativeDialog(
        context,
        'Máximo atingido!',
        'Você pode ter no máximo 5 locais!\nExclua algum caso deseje adicionar um novo!',
      );
    } else {
      Navigator.of(context).pushNamed(AppRoutes.addLocation).then((shouldReload) {
        if (shouldReload != null) {
          _loadData();
        }
      });
    }
  }
}
