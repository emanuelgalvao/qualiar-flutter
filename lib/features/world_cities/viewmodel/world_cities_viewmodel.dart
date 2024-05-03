import 'package:air_pollution_app/features/world_cities/repository/world_cities_repository_interface.dart';
import 'package:air_pollution_app/features/world_cities/viewmodel/world_cities_action.dart';
import 'package:air_pollution_app/features/world_cities/viewmodel/world_cities_state.dart';
import 'package:flutter/widgets.dart';

import '../../../core/util/app_routes.dart';

class WorldCitiesViewModel {

  final IWorldCitiesRepository worldCitiesRepository;

  WorldCitiesViewModel({
    required this.worldCitiesRepository,
  }) {
    handleAction(LoadData());
  }

  ValueNotifier<WorldCitiesState> state = ValueNotifier(Loading());

  void handleAction(WorldCitiesAction action) {
    switch (action){
      case LoadData():
        _loadData();
      case GoToDetails():
        _goToDetails(action.context, action.id);
    }
  }

  void _loadData() async {
    var worldCitiesData = await worldCitiesRepository.getWorldCitiesData();
    state.value = Reender(data: worldCitiesData);
  }

  void _goToDetails(BuildContext context, int id) {
    Navigator.of(context).pushNamed(
      AppRoutes.locationDetails,
      arguments: id,
    );
  }

}