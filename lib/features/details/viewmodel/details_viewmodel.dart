import 'package:air_pollution_app/features/details/repository/details_repository_interface.dart';
import 'package:air_pollution_app/features/details/viewmodel/details_action.dart';
import 'package:air_pollution_app/features/details/viewmodel/details_state.dart';
import 'package:flutter/widgets.dart';

class DetailsViewModel {
  final int locationId;
  final IDetailsRepository detailsRepository;

  ValueNotifier<DetailsState> state = ValueNotifier(Loading());

  DetailsViewModel({
    required this.locationId,
    required this.detailsRepository,
  }) {
    handleAction(LoadData());
  }

  void handleAction(DetailsAction action) {
    switch (action) {
      case LoadData():
        _loadData();
    }
  }

  void _loadData() async {
    final detailsData = await detailsRepository.getLocationDetails(locationId);
    state.value = Reender(data: detailsData);
  }
}
