import 'package:air_pollution_app/data/api/air_pollution_api.dart';
import 'package:air_pollution_app/data/repository/location_repository_interface.dart';
import 'package:air_pollution_app/data/model/home_data.dart';

import 'home_repository_interface.dart';

class HomeRepository extends IHomeRepository {

  @override
  ILocationRepository locationRepository;
  final AirPollutionApi airPollutionApi;

  HomeRepository({
    required this.locationRepository,
    required this.airPollutionApi,
  });

  @override
  Future<HomeData> getHomeData() async  {
    final favoriteLocationId = await locationRepository.favoriteLocationId();
    final otherLocationsId = await locationRepository.otherLocationsId();
    final homeData = await airPollutionApi.getHomeData(favoriteLocationId, otherLocationsId);
    return homeData;
  }
}