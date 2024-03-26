import 'package:air_pollution_app/components/about/about_air_quality_item.dart';
import 'package:air_pollution_app/components/about/about_card.dart';
import 'package:air_pollution_app/utils/air_pollution_level.dart';
import 'package:air_pollution_app/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Sobre'),
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            AboutCard(
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
                  Text('Qualidade do Ar Brasil'),
                  Text('Versão: 1.0.0'),
                  Text('Desenvolvido por: Emanuel Galvão'),
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
