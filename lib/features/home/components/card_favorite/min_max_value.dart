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
      child: Container(
        height: 45,
        padding: EdgeInsets.all(8),
        child: Center(
          child: FittedBox(
            child: Row(
              children: [
                Text(
                  '$title ${value.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(width: 5),
                Text(
                  'μg/m³',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
