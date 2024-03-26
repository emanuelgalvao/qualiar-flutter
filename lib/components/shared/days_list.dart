import 'package:air_pollution_app/model/home_data.dart';
import 'package:flutter/material.dart';

import 'day_item.dart';

class DaysList extends StatelessWidget {
  final List<DaysData> days;

  const DaysList({
    super.key,
    required this.days,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: days.map((day) {
        return DayItem(
          day: day.day,
          value: day.value,
        );
      }).toList(),
    );
  }
}
