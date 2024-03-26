import 'package:air_pollution_app/components/home/card_favorite/current_value.dart';
import 'package:air_pollution_app/components/home/card_favorite/min_max_value.dart';
import 'package:air_pollution_app/model/home_data.dart';
import 'package:air_pollution_app/utils/app_icons.dart';
import 'package:air_pollution_app/utils/app_routes.dart';
import 'package:flutter/material.dart';

import '../shared/days_list.dart';
import '../shared/glass_container.dart';

class CardFavoriteLocation extends StatelessWidget {
  final FavoriteLocationHomeData favoriteLocation;

  const CardFavoriteLocation({
    super.key,
    required this.favoriteLocation
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(AppRoutes.locationDetails, arguments: favoriteLocation.city.id),
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
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    AppIcons.go,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    CurrentValue(value: favoriteLocation.values.current),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        children: [
                          MinMaxValue(title: 'Min.', value: favoriteLocation.values.min),
                          const SizedBox(height: 10),
                          MinMaxValue(title: 'Max.', value: favoriteLocation.values.max)
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
