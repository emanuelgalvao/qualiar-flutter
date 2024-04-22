import 'city_data.dart';
import 'days_data.dart';
import 'values_data.dart';

class DetailsData {
  final CityData city;
  final ValuesData values;
  final List<DaysData> previousDays;
  final List<DaysData> nextDays;

  DetailsData({
    required this.city,
    required this.values,
    required this.previousDays,
    required this.nextDays,
  });
}