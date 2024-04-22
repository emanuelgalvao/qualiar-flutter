import 'package:air_pollution_app/data/api/air_pollution_api_interface.dart';
import 'package:air_pollution_app/data/model/details_data.dart';
import 'package:air_pollution_app/features/details/repository/details_repository_interface.dart';

class DetailsRepository extends IDetailsRepository {

  final IAirPollutionApi airPollutionApi;

  DetailsRepository({required this.airPollutionApi});

  @override
  Future<DetailsData> getLocationDetails(int locationId) async {
    final detailsData = await airPollutionApi.getDetailsData(locationId);
    return detailsData;
  }
  
}