import 'package:air_pollution_app/data/pollution_level/air_pollution_level_extensions.dart';
import 'package:flutter/material.dart';

import '../../../data/pollution_level/air_pollution_level.dart';

class AboutAirQualityItem extends StatelessWidget {
  final AirPollutionLevel airPollutionLevel;

  const AboutAirQualityItem({
    super.key,
    required this.airPollutionLevel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: airPollutionLevel.color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: airPollutionLevel.color,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 80,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: airPollutionLevel.color,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    airPollutionLevel.valuesRange,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  airPollutionLevel.message,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            airPollutionLevel.description,
            style: Theme.of(context).textTheme.labelSmall,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
