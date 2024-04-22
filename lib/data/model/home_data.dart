import 'package:flutter/widgets.dart';

import '../../core/util/app_icons.dart';
import 'favorite_location_home_data.dart';
import 'other_location_home_data.dart';

class HomeData {
  IconData toolbarIcon = AppIcons.light;
  final FavoriteLocationHomeData favoriteLocation;
  final List<OtherLocationHomeData> otherLocations;

  HomeData({
    required this.favoriteLocation,
    required this.otherLocations,
  });

  HomeData.fromJson(Map<String, dynamic> json)
    : favoriteLocation = FavoriteLocationHomeData.fromJson(json['favoriteLocation']),
      otherLocations = OtherLocationHomeData.fromJsonList(json['otherLocations'] as List);
}