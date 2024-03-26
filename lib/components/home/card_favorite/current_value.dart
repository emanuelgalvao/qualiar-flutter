import 'package:air_pollution_app/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../shared/glass_container.dart';

class CurrentValue extends StatelessWidget {
  final double value;

  const CurrentValue({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GlassContainer(
        color: value.airPollutionLevel.color,
        child: Container(
          height: 100,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value.toString(),
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                value.airPollutionLevel.message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
