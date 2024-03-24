import 'package:air_pollution_app/components/details/card_details_section.dart';
import 'package:air_pollution_app/components/glass_container.dart';
import 'package:air_pollution_app/components/home/card_favorite/days_list.dart';
import 'package:air_pollution_app/components/home/card_favorite/min_max_value.dart';
import 'package:air_pollution_app/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../components/home/card_favorite/current_value.dart';
import '../components/home/card_favorite/day_item.dart';

class LocationDetailsScreen extends StatelessWidget {
  const LocationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Curitiba'),
          backgroundColor: Colors.orange,
        ),
        body: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  'https://i.pinimg.com/originals/58/02/ff/5802ff4cb2c6fa5d68d3f113812a4533.jpg',
                ),
                fit: BoxFit.cover),
          ),
          child: Column(children: [
            GlassContainer(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Text(
                      'Curitiba, PR',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                        width: 200,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: const CurrentValue(value: 150)),
                    Text(
                      150.airPollutionLevel.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            const CardDetailsSection(
              title: 'Mínimo e máximo do dia',
              child: Row(
                children: [
                  Expanded(child: MinMaxValue(title: 'Min.', value: 55)),
                  SizedBox(width: 10),
                  Expanded(child: MinMaxValue(title: 'Max.', value: 150)),
                ],
              ),
            ),
            const CardDetailsSection(
              title: 'Últimos 5 dias',
              child: DaysList(
                days: {
                  '24/03': 76,
                  '25/03': 78,
                  '26/03': 70,
                  '27/03': 75,
                  '28/03': 73,
                },
              ),
            ),
            const CardDetailsSection(
              title: 'Próximos 5 dias',
              child: DaysList(
                days: {
                  '24/03': 76,
                  '25/03': 78,
                  '26/03': 70,
                  '27/03': 75,
                  '28/03': 73,
                },
              ),
            ),
          ]),
        ));
  }
}
