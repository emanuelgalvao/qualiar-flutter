import 'dart:io';

import 'package:air_pollution_app/data/location_list.dart';
import 'package:air_pollution_app/data/states_cities_list.dart';
import 'package:air_pollution_app/model/city_model.dart';
import 'package:air_pollution_app/model/location_model.dart';
import 'package:air_pollution_app/model/state_model.dart';
import 'package:air_pollution_app/utils/app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/shared/custom_button.dart';

class AddLocationScreen extends StatefulWidget {
  const AddLocationScreen({super.key});

  @override
  State<AddLocationScreen> createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends State<AddLocationScreen> {
  bool _isLoadingStates = true;
  bool _isLoadingCities = false;
  StateModel? _selectedState;
  CityModel? _selectedCity;

  void _saveLocation() {
    final locationsProvider = Provider.of<LocationList>(
      context,
      listen: false,
    );
    if (_selectedCity == null) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog.adaptive(
            title: const Text('Nenhuma cidade selecionada!'),
            content: const Text(
                'Você precisa selecionar uma cidade para adicionar a localização!'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Ok'),
              ),
            ],
          );
        },
      );
      return;
    } else {
      locationsProvider.addLocation(
        LocationModel(
          id: _selectedCity!.id,
          name: _selectedCity!.name,
          uf: _selectedState!.uf,
        ),
      );
      Navigator.of(context).pop();
    }
  }

  void _showCupertinoPicker({
    required BuildContext context,
    required Function(int) onSelectedItemChanged,
    required List<Widget> children,
  }) {
    showCupertinoModalPopup(
      context: context,
      builder: (ctx) {
        return SizedBox(
          width: double.infinity,
          height: 300,
          child: CupertinoPicker(
            itemExtent: 30,
            backgroundColor: Colors.white,
            scrollController: FixedExtentScrollController(),
            onSelectedItemChanged: onSelectedItemChanged,
            children: children,
          ),
        );
      },
    );
  }

  void _selectState(BuildContext context) {
    final statesCitiesProvider = Provider.of<StatesCitiesList>(
      context,
      listen: false,
    );

    if (Platform.isIOS) {
      _showCupertinoPicker(
        context: context,
        onSelectedItemChanged: (index) {
          setState(() {
            _selectedState = statesCitiesProvider.states[index];
            _selectedCity = null;
          });
          statesCitiesProvider.clearCities();
        },
        children: statesCitiesProvider.states.map(
          (state) {
            return Text(state.name);
          },
        ).toList(),
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) {
          return SimpleDialog(
            children: statesCitiesProvider.states.map(
              (state) {
                return SimpleDialogOption(
                  onPressed: () {
                    setState(() {
                      _selectedState = state;
                      _selectedCity = null;
                    });
                    statesCitiesProvider.clearCities();
                    Navigator.of(context).pop();
                  },
                  child: Text(state.name),
                );
              },
            ).toList(),
          );
        },
      );
    }
  }

  void _showCityPicker() {
    final statesCitiesProvider = Provider.of<StatesCitiesList>(
      context,
      listen: false,
    );

    if (Platform.isIOS) {
      _showCupertinoPicker(
        context: context,
        onSelectedItemChanged: (index) {
          setState(() {
            _selectedCity = statesCitiesProvider.cities[index];
          });
        },
        children: statesCitiesProvider.cities.map(
          (city) {
            return Text(city.name);
          },
        ).toList(),
      );
    } else {
      showDialog(
          context: context,
          builder: (ctx) {
            return SimpleDialog(
              children: statesCitiesProvider.cities.map(
                (city) {
                  return SimpleDialogOption(
                    onPressed: () {
                      setState(() {
                        _selectedCity = city;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text(city.name),
                  );
                },
              ).toList(),
            );
          });
    }
  }

  void _selectCity(BuildContext context) {
    final statesCitiesProvider = Provider.of<StatesCitiesList>(
      context,
      listen: false,
    );

    if (_selectedState == null) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog.adaptive(
            title: const Text('Nenhum estado selecionado!'),
            content: const Text(
                'Você precisa selecionar um estado antes de escolher a cidade!'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Ok'),
              ),
            ],
          );
        },
      );
      return;
    }

    if (statesCitiesProvider.cities.isEmpty) {
      setState(() {
        _isLoadingCities = true;
      });
      statesCitiesProvider.loadCitiesFromState(_selectedState!.uf).then((_) {
        setState(() {
          _isLoadingCities = false;
        });
        _showCityPicker();
      });
    } else {
      _showCityPicker();
    }
  }

  @override
  void initState() {
    super.initState();
    Provider.of<StatesCitiesList>(context, listen: false)
        .loadStates()
        .then((value) {
      setState(
        () {
          _isLoadingStates = false;
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar'),
        actions: [
          IconButton(
            onPressed: () => _saveLocation(),
            icon: Icon(AppIcons.save),
          )
        ],
      ),
      body: _isLoadingStates
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: Column(
                children: [
                  const Text(
                    'Qual o estado?',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _selectedState == null
                        ? 'Nenhum estado selecionado.'
                        : _selectedState!.name,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    label: _selectedState == null
                        ? 'Selecionar Estado'
                        : 'Alterar Estado',
                    onPressed: () => _selectState(context),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Qual a cidade?',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _isLoadingCities
                      ? const CircularProgressIndicator.adaptive()
                      : Column(
                          children: [
                            Text(
                              _selectedCity == null
                                  ? 'Nenhuma cidade selecionada.'
                                  : _selectedCity!.name,
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(height: 10),
                            CustomButton(
                              label: _selectedCity == null
                                  ? 'Selecionar Cidade'
                                  : 'Alterar Cidade',
                              onPressed: () => _selectCity(context),
                            ),
                          ],
                        ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      label: 'Salvar',
                      onPressed: () => _saveLocation(),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
