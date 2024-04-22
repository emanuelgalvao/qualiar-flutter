import 'package:air_pollution_app/data/repository/location_repository_interface.dart';
import 'package:air_pollution_app/data/model/home_data.dart';

abstract class IHomeRepository {
  late ILocationRepository locationRepository;

  Future<HomeData> getHomeData();
}