import 'package:flutter/material.dart';

import 'day_item.dart';

class DaysList extends StatelessWidget {
  final Map<String, int> days;

  const DaysList({
    super.key,
    required this.days,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: days.keys.map((day) {
        final value = days[day] ?? 0;
        return DayItem(
          day: day,
          value: value,
        );
      }).toList(),
    );
  }
}
