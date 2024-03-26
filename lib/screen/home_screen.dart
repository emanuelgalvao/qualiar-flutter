import 'package:air_pollution_app/components/home/card_other_location.dart';
import 'package:air_pollution_app/data/air_pollution_data.dart';
import 'package:air_pollution_app/data/location_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/home/card_favorite_location.dart';
import '../components/shared/glass_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    final locationsProvider = Provider.of<LocationList>(context, listen: false);

    Provider.of<AirPollutionData>(context, listen: false)
        .getHomeData(locationsProvider.locations)
        .then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var homeData = Provider.of<AirPollutionData>(context).homeData;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                'https://i.pinimg.com/originals/58/02/ff/5802ff4cb2c6fa5d68d3f113812a4533.jpg',
              ),
              fit: BoxFit.cover),
        ),
        child: _isLoading
            ? Center(
                child: GlassContainer(
                  child: Container(
                    height: 80,
                    padding: const EdgeInsets.all(20),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator.adaptive(
                          backgroundColor: Colors.white,
                        ),
                        Text(
                          'Carregando...',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Column(
                children: [
                  AppBar(
                    title: const Text(
                      'Qualidade do Ar Brasil',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.black54,
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        CardFavoriteLocation(
                            favoriteLocation: homeData!.favoriteLocation),
                        Column(
                          children: homeData.otherLocations
                              .map(
                                (location) => CardOtherLocation(
                                  otherLocation: location,
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
