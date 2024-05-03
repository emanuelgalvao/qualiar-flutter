import 'package:air_pollution_app/data/pollution_level/air_pollution_level_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/components/glass_container.dart';

class CurrentValue extends StatelessWidget {
  final double value;

  const CurrentValue({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
        color: value.airPollutionLevel.color,
        child: Container(
          height: 100,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value.toStringAsFixed(2),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                value.airPollutionLevel.message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ),
    );
  }
}
