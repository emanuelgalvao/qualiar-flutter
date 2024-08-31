import 'package:flutter/material.dart';

import '../../../core/shared/components/days_list.dart';
import '../../../core/shared/components/glass_container.dart';
import '../../../core/util/app_icons.dart';
import '../../../data/model/favorite_location_home_data.dart';
import 'card_favorite/current_value.dart';
import 'card_favorite/min_max_value.dart';

class CardFavoriteLocation extends StatelessWidget {
  final FavoriteLocationHomeData favoriteLocation;
  final Function(int) onTap;

  const CardFavoriteLocation({
    required this.favoriteLocation,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(favoriteLocation.city.id),
      child: GlassContainer(
        blur: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      '${favoriteLocation.city.name}, ${favoriteLocation.city.uf}',
                      style: Theme.of(context).textTheme.titleLarge),
                  Icon(
                    AppIcons.go,
                    color: Theme.of(context).colorScheme.primary,
                    size: 30,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: CurrentValue(
                        value: favoriteLocation.values.current,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        children: [
                          MinMaxValue(
                              title: 'Min.',
                              value: favoriteLocation.values.min),
                          const SizedBox(height: 10),
                          MinMaxValue(
                              title: 'Max.', value: favoriteLocation.values.max)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              DaysList(days: favoriteLocation.nextDays)
            ],
          ),
        ),
      ),
    );
  }
}
