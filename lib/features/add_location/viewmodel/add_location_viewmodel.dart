import 'dart:io';

import 'package:air_pollution_app/data/model/city_model.dart';
import 'package:air_pollution_app/data/model/location_model.dart';
import 'package:air_pollution_app/data/model/state_model.dart';
import 'package:air_pollution_app/features/add_location/repository/add_location_repository_interface.dart';
import 'package:flutter/material.dart';

import '../../../core/shared/dialog/show_dialog.dart';
import '../util/show_selector.dart';
import 'add_location_action.dart';
import 'add_location_state.dart';

class AddLocationViewModel {
  final IAddLocationRepository addLocationRepository;

  ValueNotifier<Display> state = ValueNotifier(Display(
    isLoadingStates: true,
    isLoadingCities: false,
    stateName: '',
    cityName: '',
  ));

  StateModel? _selectedState;
  CityModel? _selectedCity;

  List<StateModel> _availableStates = [];
  List<CityModel> _availableCities = [];

  AddLocationViewModel({
    required this.addLocationRepository,
  }) {
    _loadStates();
  }

  void handleAction(AddLocationAction action) {
    switch (action) {
      case ChooseState():
        _chooseState(action.context);
      case ChooseCity():
        _chooseCity(action.context);
      case AddLocation():
        _addLocation(action.context);
    }
  }

  void _chooseState(BuildContext context) {
    showAdaptiveSelector(
      context: context,
      onSelectedItemChanged: Platform.isIOS
          ? (index) {
              _selectedState = _availableStates[index];
              _availableCities = [];
              _selectedCity = null;
              _loadCities();
            }
          : null,
      children: Platform.isIOS
          ? _availableStates.map(
              (state) {
                return Text(state.name);
              },
            ).toList()
          : _availableStates.map(
              (state) {
                return SimpleDialogOption(
                  onPressed: () {
                    _selectedState = state;
                    _availableCities = [];
                    _selectedCity = null;
                    _loadCities();
                    Navigator.of(context).pop();
                  },
                  child: Text(state.name,
                      style: Theme.of(context).textTheme.labelMedium),
                );
              },
            ).toList(),
    );
  }

  void _chooseCity(BuildContext context) {
    if (_selectedState == null) {
      showAdaptativeDialog(
        context,
        'Nenhum estado selecionado!',
        'Você precisa selecionar um estado antes de escolher a cidade!',
      );
      return;
    }
    showAdaptiveSelector(
      context: context,
      onSelectedItemChanged: Platform.isIOS
          ? (index) {
              _selectedCity = _availableCities[index];
              state.value = Display(
                isLoadingStates: false,
                isLoadingCities: false,
                stateName: _selectedState?.name ?? '',
                cityName: _selectedCity?.name ?? '',
              );
            }
          : null,
      children: Platform.isIOS
          ? _availableCities.map(
              (city) {
                return Text(city.name);
              },
            ).toList()
          : _availableCities.map(
              (city) {
                return SimpleDialogOption(
                  onPressed: () {
                    _selectedCity = city;
                    Navigator.of(context).pop();
                  },
                  child: Text(city.name,
                      style: Theme.of(context).textTheme.labelMedium),
                );
              },
            ).toList(),
    );
  }

  void _addLocation(BuildContext context) async {
    if (_selectedCity == null) {
      showAdaptativeDialog(
        context,
        'Nenhuma cidade selecionada!',
        'Você precisa selecionar uma cidade para adicionar o local!',
      );
      return;
    }
    await addLocationRepository.saveLocation(LocationModel(
      id: _selectedCity!.id,
      name: _selectedCity!.name,
      uf: _selectedState!.uf,
    ));
    Navigator.of(context).pop(true);
  }

  void _loadStates() async {
    final states = await addLocationRepository.getStates();
    _availableStates = states;
    state.value = Display(
      isLoadingStates: false,
      isLoadingCities: false,
      stateName: '',
      cityName: '',
    );
  }

  void _loadCities() async {
    state.value = Display(
      isLoadingStates: false,
      isLoadingCities: true,
      stateName: _selectedState?.name ?? '',
      cityName: '',
    );
    final uf = _selectedState?.uf;
    if (uf == null) {
      return;
    }
    final cities = await addLocationRepository.getCitiesFromState(uf);
    _availableCities = cities;
    state.value = Display(
      isLoadingStates: false,
      isLoadingCities: false,
      stateName: _selectedState?.name ?? '',
      cityName: '',
    );
  }
}
