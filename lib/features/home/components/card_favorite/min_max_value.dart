import 'package:air_pollution_app/data/pollution_level/air_pollution_level_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/components/glass_container.dart';

class MinMaxValue extends StatelessWidget {
  final String title;
  final double value;

  const MinMaxValue({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      color: value.airPollutionLevel.color,
      borderRadius: 25,
      child: SizedBox(
        height: 45,
        child: Center(
          child: Text(
            '$title $value',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
