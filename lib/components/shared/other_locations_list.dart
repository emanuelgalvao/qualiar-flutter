import 'package:air_pollution_app/model/home_data.dart';
import 'package:flutter/material.dart';

import '../home/card_other_location.dart';

class OtherLocationsList extends StatelessWidget {
  final List<OtherLocationHomeData> otherLocations;

  const OtherLocationsList({
    super.key,
    required this.otherLocations,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: otherLocations.map((location) {
        return CardOtherLocation(
          otherLocation: location,
        );
      }).toList(),
    );
  }
}
