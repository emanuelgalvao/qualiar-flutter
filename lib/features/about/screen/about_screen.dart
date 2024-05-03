import 'package:air_pollution_app/data/pollution_level/air_pollution_level.dart';
import 'package:flutter/material.dart';

import '../components/about_air_quality_item.dart';
import '../components/about_card.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Sobre'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AboutCard(
              title: 'Quais são os níveis de poluição?',
              child: Column(
                children: [
                  AboutAirQualityItem(
                      airPollutionLevel: AirPollutionLevel.good),
                  AboutAirQualityItem(
                      airPollutionLevel: AirPollutionLevel.moderate),
                  AboutAirQualityItem(
                      airPollutionLevel:
                          AirPollutionLevel.unhealthyForSensitiveGroups),
                  AboutAirQualityItem(
                      airPollutionLevel: AirPollutionLevel.unhealthy),
                  AboutAirQualityItem(
                      airPollutionLevel: AirPollutionLevel.veryUnhealthy),
                  AboutAirQualityItem(
                      airPollutionLevel: AirPollutionLevel.hazardous),
                ],
              ),
            ),
            AboutCard(
              title: 'Sobre o App',
              child: Column(
                children: [
                  Text(
                    'QualiAr Brasil',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Text(
                    'Versão: 1.0.1',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Text(
                    'Desenvolvido por: Emanuel Galvão',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            AboutCard(
              title: 'Créditos',
              child: Column(
                children: [
                  Text(
                    'Informações sobre a qualidade do ar fornecidas pela API de Air Quality da Open-Meteo.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
