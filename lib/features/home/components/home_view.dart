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
      child: Column(
        children: [
          AppBar(
            title: const Text(
              'QualiAr Brasil',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  onSwapTheme();
                },
                icon: Icon(reender.data.toolbarIcon),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10),
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
          )
        ],
      ),
    );
  }
}
