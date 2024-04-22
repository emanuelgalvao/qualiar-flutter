import 'package:air_pollution_app/data/model/details_data.dart';

sealed class DetailsState {}

class Loading extends DetailsState {}

class Reender extends DetailsState {
  final DetailsData data;
  Reender({
    required this.data,
  });
}