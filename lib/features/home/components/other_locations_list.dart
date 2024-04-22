import 'package:flutter/material.dart';

import '../../../data/model/other_location_home_data.dart';
import 'card_other_location.dart';


class OtherLocationsList extends StatelessWidget {
  final List<OtherLocationHomeData> otherLocations;
  final Function (int) onTap;

  const OtherLocationsList({
    required this.otherLocations,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: otherLocations.map((location) {
        return CardOtherLocation(
          otherLocation: location,
          onTap: onTap,
        );
      }).toList(),
    );
  }
}
