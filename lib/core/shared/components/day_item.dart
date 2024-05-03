import 'package:air_pollution_app/data/pollution_level/air_pollution_level_extensions.dart';
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
              FittedBox(
                child: Text(
                  value == 0.0 ? "?" : value.toStringAsFixed(2),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Text(
                day,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
