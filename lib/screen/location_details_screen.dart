import 'package:air_pollution_app/components/details/card_details_header.dart';
import 'package:air_pollution_app/components/details/card_details_section.dart';
import 'package:air_pollution_app/components/home/card_favorite/min_max_value.dart';
import 'package:air_pollution_app/components/shared/loading_container.dart';
import 'package:air_pollution_app/model/home_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/shared/days_list.dart';
import '../data/air_pollution_data.dart';

class LocationDetailsScreen extends StatefulWidget {
  const LocationDetailsScreen({super.key});

  @override
  State<LocationDetailsScreen> createState() => _LocationDetailsScreenState();
}

class _LocationDetailsScreenState extends State<LocationDetailsScreen> {
  bool _isLoading = true;
  DetailsData? locationDetails;

  @override
  void initState() {
    super.initState();

    final airPoluttionProvider =
        Provider.of<AirPollutionData>(context, listen: false);

    var locationId = airPoluttionProvider.selectedLocation;

    if (locationId is int) {
      airPoluttionProvider.getDetailsData(locationId).then((value) {
        setState(() {
          locationDetails = airPoluttionProvider.detailsData;
          _isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ar+',
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
                color:
                    Theme.of(context).colorScheme.background.withOpacity(0.4)),
            child: _isLoading
                ? const LoadingContainer()
                : Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            CardDetailsHeader(detailsData: locationDetails!),
                            CardDetailsSection(
                              title: 'Mínimo e máximo do dia',
                              child: Row(
                                children: [
                                  Expanded(
                                    child: MinMaxValue(
                                        title: 'Min.',
                                        value: locationDetails!.values.min),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: MinMaxValue(
                                        title: 'Max.',
                                        value: locationDetails!.values.max),
                                  ),
                                ],
                              ),
                            ),
                            CardDetailsSection(
                              title: 'Últimos 5 dias',
                              child: DaysList(
                                days: locationDetails!.previousDays,
                              ),
                            ),
                            CardDetailsSection(
                              title: 'Próximos 5 dias',
                              child: DaysList(
                                days: locationDetails!.nextDays,
                              ),
                            ),
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
