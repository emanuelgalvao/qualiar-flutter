import 'package:air_pollution_app/utils/extensions.dart';
import 'package:flutter/material.dart';

import 'glass_container.dart';

class DayItem extends StatelessWidget {
  final String day;
  final double value;

  const DayItem({
    super.key,
    required this.day,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final principalCardAvailableWidth = mediaQuery.size.width - 16 - (6 * 4);

    return Expanded(
      child: GlassContainer(
        color: value.airPollutionLevel.color,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        child: SizedBox(
          height: principalCardAvailableWidth / 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value == 0.0 ? "?" : value.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                day,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
