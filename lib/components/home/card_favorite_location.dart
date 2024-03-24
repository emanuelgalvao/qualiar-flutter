import 'package:air_pollution_app/components/home/card_favorite/current_value.dart';
import 'package:air_pollution_app/components/home/card_favorite/day_item.dart';
import 'package:air_pollution_app/components/home/card_favorite/min_max_value.dart';
import 'package:air_pollution_app/components/glass_container.dart';
import 'package:air_pollution_app/utils/app_routes.dart';
import 'package:flutter/material.dart';

class CardFavoriteLocation extends StatelessWidget {
  final String title;
  final int currentValue;
  final int minValue;
  final int maxValue;
  final Map<String, int> nextDays;

  const CardFavoriteLocation({
    super.key,
    required this.title,
    required this.currentValue,
    required this.minValue,
    required this.maxValue,
    required this.nextDays,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(AppRoutes.locationDetails),
      child: GlassContainer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    CurrentValue(value: currentValue),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        children: [
                          MinMaxValue(title: 'Min.', value: minValue),
                          const SizedBox(height: 10),
                          MinMaxValue(title: 'Max.', value: maxValue)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: nextDays.keys.map((day) {
                  final value = nextDays[day] ?? 0;
                  return DayItem(
                    day: day,
                    value: value,
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
