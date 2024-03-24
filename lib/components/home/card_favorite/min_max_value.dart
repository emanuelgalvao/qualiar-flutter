import 'package:air_pollution_app/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../glass_container.dart';

class MinMaxValue extends StatelessWidget {
  final String title;
  final int value;

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
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
