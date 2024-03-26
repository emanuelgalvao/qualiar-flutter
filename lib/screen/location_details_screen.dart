import 'package:air_pollution_app/components/details/card_details_section.dart';
import 'package:air_pollution_app/components/home/card_favorite/min_max_value.dart';
import 'package:air_pollution_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/home/card_favorite/current_value.dart';
import '../components/shared/days_list.dart';
import '../components/shared/glass_container.dart';
import '../data/air_pollution_data.dart';

class LocationDetailsScreen extends StatefulWidget {
  const LocationDetailsScreen({super.key});

  @override
  State<LocationDetailsScreen> createState() => _LocationDetailsScreenState();
}

class _LocationDetailsScreenState extends State<LocationDetailsScreen> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    var locationsDetails = Provider.of<AirPollutionData>(context).detailsData;

    final locationId = (ModalRoute.of(context)?.settings.arguments as int) ?? 0;
    Provider.of<AirPollutionData>(context, listen: false)
        .getDetailsData(locationId)
        .then((value) {
      setState(() {
        _isLoading = false;
      });
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                'https://i.pinimg.com/originals/58/02/ff/5802ff4cb2c6fa5d68d3f113812a4533.jpg',
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            AppBar(
              title: const Text(
                'Air Pollution',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.black54,
              foregroundColor: Colors.white,
            ),
            Container(
                margin: const EdgeInsets.all(10),
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
                    : Column(children: [
                        GlassContainer(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(
                                  '${locationsDetails!.city.name}, ${locationsDetails.city.uf}',
                                  style: const TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                    width: 200,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: CurrentValue(
                                        value:
                                            locationsDetails.values.current)),
                                Text(
                                  locationsDetails.values.current
                                      .airPollutionLevel.description,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        CardDetailsSection(
                          title: 'Mínimo e máximo do dia',
                          child: Row(
                            children: [
                              Expanded(
                                  child: MinMaxValue(
                                      title: 'Min.',
                                      value: locationsDetails.values.min)),
                              const SizedBox(width: 10),
                              Expanded(
                                  child: MinMaxValue(
                                      title: 'Max.',
                                      value: locationsDetails.values.max)),
                            ],
                          ),
                        ),
                        CardDetailsSection(
                          title: 'Últimos 5 dias',
                          child: DaysList(
                            days: locationsDetails.previousDays,
                          ),
                        ),
                        CardDetailsSection(
                          title: 'Próximos 5 dias',
                          child: DaysList(
                            days: locationsDetails.nextDays,
                          ),
                        ),
                      ]))
          ],
        ),
      ),
    );
  }
}
