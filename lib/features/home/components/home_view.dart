import 'package:flutter/material.dart';

import 'other_locations_list.dart';
import '../viewmodel/home_state.dart';
import 'card_favorite_location.dart';

class HomeView extends StatelessWidget {
  final Reender reender;
  final Function() onSwapTheme;
  final Function(int) onTapLocation;

  const HomeView({
    required this.reender,
    required this.onSwapTheme,
    required this.onTapLocation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        child: Column(
          children: [
            CardFavoriteLocation(
              favoriteLocation: reender.data.favoriteLocation,
              onTap: onTapLocation,
            ),
            OtherLocationsList(
              otherLocations: reender.data.otherLocations,
              onTap: onTapLocation,
            ),
          ],
        ),
      ),
    );
  }
}
