import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/shared/components/loading_container.dart';
import '../../../data/api/air_pollution_api.dart';
import '../../../data/repository/location_repository.dart';
import '../../../data/storage/shared_preferences_local_storage.dart';
import '../components/home_view.dart';
import '../repository/home_repository.dart';
import '../viewmodel/home_action.dart';
import '../viewmodel/home_state.dart';
import '../viewmodel/home_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeViewModel homeViewModel;

  @override
  void initState() {
    super.initState();
    homeViewModel = HomeViewModel(
      homeRepository: HomeRepository(
          locationRepository: LocationRepository(
            storage: SharedPreferencesLocalStorage(),
          ),
          airPollutionApi: AirPollutionApi()),
      themeProvider: Provider.of(context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: homeViewModel.state,
        builder: (context, state, _) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
            title: const Text(
              'QualiAr',
            ),
            actions: [
              IconButton(
                onPressed: () => homeViewModel.handleAction(SwapTheme()),
                icon: Icon(state.toolbarIcon),
              )
            ],
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
                  height: double.infinity,
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .background
                          .withOpacity(0.4)),
                  child: switch (state) {
                    Loading() => const LoadingContainer(),
                    Reender() => HomeView(
                        reender: state,
                        onSwapTheme: () =>
                            homeViewModel.handleAction(SwapTheme()),
                        onTapLocation: (locationId) =>
                            homeViewModel.handleAction(
                          GoToDetails(
                            context: context,
                            locationId: locationId,
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
