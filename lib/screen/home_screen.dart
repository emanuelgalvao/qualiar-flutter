import 'dart:convert';

import 'package:air_pollution_app/components/shared/loading_container.dart';
import 'package:air_pollution_app/components/shared/other_locations_list.dart';
import 'package:air_pollution_app/data/air_pollution_data.dart';
import 'package:air_pollution_app/data/location_list.dart';
import 'package:air_pollution_app/data/theme_provider.dart';
import 'package:air_pollution_app/model/home_data.dart';
import 'package:air_pollution_app/model/location_model.dart';
import 'package:air_pollution_app/utils/app_icons.dart';
import 'package:air_pollution_app/utils/default_locations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/home/card_favorite_location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;
  HomeData? homeData;

  _getHomeData() {
    final locationsProvider = Provider.of<LocationList>(context, listen: false);
    final airPollutionDataProvider =
        Provider.of<AirPollutionData>(context, listen: false);
    airPollutionDataProvider
        .getHomeData(locationsProvider.locations)
        .then((value) {
      setState(() {
        homeData = airPollutionDataProvider.homeData;
        _isLoading = false;
      });
    });
  }

  Future<void> _loadLocations() async {
    final preferences = await SharedPreferences.getInstance();
    var savedLocations = preferences.getString('locations');
    List<LocationModel> locations = [];
    if (savedLocations == null) {
      locations = defaultLocations;
    } else {
      jsonDecode(savedLocations)['locations'].forEach((element) {
        locations.add(LocationModel.fromJson(element));
      });
    }
    Provider.of<LocationList>(context, listen: false).setLocations(locations);
  }

  @override
  void initState() {
    super.initState();
    _loadLocations().then((value) => _getHomeData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                color:
                    Theme.of(context).colorScheme.background.withOpacity(0.4)),
            child: _isLoading
                ? const LoadingContainer()
                : Column(
                    children: [
                      AppBar(
                        title: const Text(
                          'Ar+',
                        ),
                        actions: [
                          IconButton(
                            onPressed: () {
                              Provider.of<ThemeProvider>(context, listen: false).swapTheme();
                            },
                            icon: Icon(
                              Provider.of<ThemeProvider>(context, listen: false).isDarkMode
                                  ? AppIcons.light
                                  : AppIcons.dark,
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            CardFavoriteLocation(
                                favoriteLocation: homeData!.favoriteLocation),
                            OtherLocationsList(
                                otherLocations: homeData!.otherLocations),
                          ],
                        ),
                      )
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
