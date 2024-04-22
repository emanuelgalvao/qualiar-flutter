import 'package:air_pollution_app/data/pollution_level/air_pollution_level_extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/shared/components/glass_container.dart';
import '../../../data/model/details_data.dart';
import '../../home/components/card_favorite/current_value.dart';

class CardDetailsHeader extends StatelessWidget {
  final DetailsData detailsData;

  const CardDetailsHeader({
    super.key,
    required this.detailsData,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              '${detailsData.city.name}, ${detailsData.city.uf}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Container(
                width: 200,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: CurrentValue(value: detailsData.values.current)),
            Text(
              detailsData.values.current.airPollutionLevel.description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
