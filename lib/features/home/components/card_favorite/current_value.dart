import 'package:air_pollution_app/data/pollution_level/air_pollution_level_extensions.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
        padding: EdgeInsets.all(8),
        height: 110,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    value.toStringAsFixed(2),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'μg/m³',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
            AutoSizeText(
              value.airPollutionLevel.message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
