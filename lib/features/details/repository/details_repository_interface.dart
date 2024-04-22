import 'package:air_pollution_app/data/model/details_data.dart';

abstract class IDetailsRepository {

  Future<DetailsData> getLocationDetails(int locationId);
}