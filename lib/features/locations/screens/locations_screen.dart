import 'package:air_pollution_app/features/locations/viewmodel/locations_action.dart';
import 'package:air_pollution_app/features/locations/viewmodel/locations_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../../core/util/app_icons.dart';
import '../../../data/repository/location_repository.dart';
import '../../../data/storage/shared_preferences_local_storage.dart';
import '../viewmodel/locations_state.dart';

class LocationsScreen extends StatefulWidget {
  const LocationsScreen({super.key});

  @override
  State<LocationsScreen> createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  late LocationsViewModel locationsViewModel;

  @override
  void initState() {
    super.initState();
    locationsViewModel = LocationsViewModel(
      locationRepository: LocationRepository(
        storage: SharedPreferencesLocalStorage(),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: locationsViewModel.state,
        builder: (context, state, _) {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(
              title: const Text('Meus Locais'),
              actions: [
                IconButton(
                  onPressed: () {
                    locationsViewModel.handleAction(
                      GoToAddLocation(context: context),
                    );
                  },
                  icon: Icon(AppIcons.add),
                ),
              ],
            ),
            body: switch (state) {
              Loading() => CircularProgressIndicator.adaptive(),
              Show() => ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (ctx, index) {
                    final location = state.data[index];
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            '${location.name}, ${location.uf}',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          trailing: Container(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    locationsViewModel.handleAction(
                                        ChooseFavorite(
                                            locationId: location.id));
                                  },
                                  icon: Icon(
                                    AppIcons.favorite,
                                    color: location.isFavorite
                                        ? Colors.deepOrange
                                        : Colors.grey,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    locationsViewModel.handleAction(
                                      Remove(
                                        context: context,
                                        location: location,
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    AppIcons.delete,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(),
                      ],
                    );
                  })
            },
          );
        });
  }
}
