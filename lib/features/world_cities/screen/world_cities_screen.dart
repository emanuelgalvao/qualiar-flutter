import 'package:air_pollution_app/data/api/air_pollution_api.dart';
import 'package:air_pollution_app/data/model/other_location_home_data.dart';
import 'package:air_pollution_app/features/home/components/other_locations_list.dart';
import 'package:air_pollution_app/features/world_cities/repository/world_cities_repository.dart';
import 'package:air_pollution_app/features/world_cities/viewmodel/world_cities_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../../core/shared/components/loading_container.dart';
import '../viewmodel/world_cities_action.dart';
import '../viewmodel/world_cities_state.dart';

class WorldCitiesScreen extends StatefulWidget {
  const WorldCitiesScreen({super.key});

  @override
  State<WorldCitiesScreen> createState() => _WorldCitiesScreenState();
}

class _WorldCitiesScreenState extends State<WorldCitiesScreen> {
  late WorldCitiesViewModel worldCitiesViewModel;

  @override
  void initState() {
    super.initState();
    worldCitiesViewModel = WorldCitiesViewModel(
      worldCitiesRepository: WorldCitiesRepository(
        airPollutionApi: AirPollutionApi(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: worldCitiesViewModel.state,
        builder: (context, state, _) {
          return Scaffold(
            appBar: AppBar(
            title: const Text(
              'Cidades do Mundo',
            ),
          ),
            body: Stack(
              children: [
                Container(
                  width: double.infinity,
                  child: Image.network(
                    'https://i.pinimg.com/originals/58/02/ff/5802ff4cb2c6fa5d68d3f113812a4533.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .background
                          .withOpacity(0.4)),
                  child: switch (state) {
                    Loading() => const LoadingContainer(),
                    Reender() => SingleChildScrollView(
                      child: OtherLocationsList(
                          otherLocations: state.data
                              .map((e) => OtherLocationHomeData(
                                  id: e.id,
                                  name: e.city,
                                  uf: e.country,
                                  value: e.value))
                              .toList(),
                          onTap: (id) => worldCitiesViewModel.handleAction(
                            GoToDetails(
                              context: context,
                              id: id,
                            ),
                          ),
                        ),
                    ),
                  },
                ),
              ],
            ),
          );
        });
  }
}
