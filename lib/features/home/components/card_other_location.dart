import 'package:air_pollution_app/data/pollution_level/air_pollution_level_extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/shared/components/glass_container.dart';
import '../../../core/util/app_icons.dart';
import '../../../data/model/other_location_home_data.dart';


class CardOtherLocation extends StatelessWidget {
  final OtherLocationHomeData otherLocation;
  final Function (int) onTap;

  const CardOtherLocation({
    required this.otherLocation,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(otherLocation.id),
      child: GlassContainer(
        margin: const EdgeInsets.only(top: 10),
        child: Container(
          margin: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              GlassContainer(
                color: otherLocation.value.airPollutionLevel.color,
                child: Container(
                  width: 100,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        otherLocation.value.toString(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        otherLocation.value.airPollutionLevel.message,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  '${otherLocation.name}, ${otherLocation.uf}',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Icon(
                AppIcons.go,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
