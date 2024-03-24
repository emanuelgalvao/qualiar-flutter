import 'package:air_pollution_app/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../glass_container.dart';

class CardOtherLocation extends StatelessWidget {
  final String title;
  final int value;

  const CardOtherLocation({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      margin: const EdgeInsets.only(top: 10),
      child: Container(
        margin: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            GlassContainer(
              color: value.airPollutionLevel.color,
              child: Container(
                width: 100,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      value.toString(),
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      value.airPollutionLevel.message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'São Paulo, SP',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Icon(
              Icons.navigate_next,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
