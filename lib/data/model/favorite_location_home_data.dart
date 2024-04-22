import 'city_data.dart';
import 'days_data.dart';
import 'values_data.dart';

class FavoriteLocationHomeData {
  final CityData city;
  final ValuesData values;
  final List<DaysData> nextDays;

  FavoriteLocationHomeData({
    required this.city,
    required this.values,
    required this.nextDays,
  });

  FavoriteLocationHomeData.fromJson(Map<String, dynamic> json) 
    : city = CityData.fromJson(json['city']), 
      values = ValuesData.fromJson(json['values']), 
      nextDays = DaysData.fromJsonList(json['nextDays'] as List);
}