import 'package:air_pollution_app/data/api/air_pollution_api.dart';
import 'package:air_pollution_app/data/repository/location_repository.dart';
import 'package:air_pollution_app/data/storage/shared_preferences_local_storage.dart';
import 'package:air_pollution_app/features/add_location/components/select_button_section_widget.dart';
import 'package:air_pollution_app/features/add_location/repository/add_location_repository.dart';
import 'package:air_pollution_app/features/add_location/viewmodel/add_location_action.dart';
import 'package:air_pollution_app/features/add_location/viewmodel/add_location_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../../core/util/app_icons.dart';
import '../components/custom_button.dart';

class AddLocationScreen extends StatefulWidget {
  const AddLocationScreen({super.key});

  @override
  State<AddLocationScreen> createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends State<AddLocationScreen> {
  AddLocationViewModel addLocationViewModel = AddLocationViewModel(
    addLocationRepository: AddLocationRepository(
      airPollutionApi: AirPollutionApi(),
      locationRepository: LocationRepository(
        storage: SharedPreferencesLocalStorage(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Adicionar'),
        actions: [
          IconButton(
            onPressed: () => addLocationViewModel.handleAction(
              AddLocation(context: context),
            ), //_saveLocation(),
            icon: Icon(AppIcons.save),
          )
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: addLocationViewModel.state,
        builder: (context, state, _) {
          return Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: Column(
              children: [
                SelectButtonSectionWidget(
                  isLoading: state.isLoadingStates,
                  title: 'Qual o estado?',
                  message: state.stateName.isEmpty
                      ? 'Nenhum estado selecionado.'
                      : state.stateName,
                  buttonText: state.stateName.isEmpty
                      ? 'Selecionar Estado'
                      : 'Alterar Estado',
                  onTap: () => addLocationViewModel.handleAction(
                    ChooseState(context: context),
                  ),
                ),
                SelectButtonSectionWidget(
                  isLoading: state.isLoadingCities,
                  title: 'Qual a cidade?',
                  message: state.cityName.isEmpty
                      ? 'Nenhuma cidade selecionada.'
                      : state.cityName,
                  buttonText: state.cityName.isEmpty
                      ? 'Selecionar Cidade'
                      : 'Alterar Cidade',
                  onTap: () => addLocationViewModel.handleAction(
                    ChooseCity(context: context),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    label: 'Salvar',
                    onPressed: () => addLocationViewModel.handleAction(
                      AddLocation(context: context),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
