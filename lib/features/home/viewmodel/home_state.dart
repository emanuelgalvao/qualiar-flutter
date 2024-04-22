import '../../../data/model/home_data.dart';

sealed class HomeState {}

class Loading extends HomeState {}

class Reender extends HomeState {
  final HomeData data;
  Reender({
    required this.data,
  });
}