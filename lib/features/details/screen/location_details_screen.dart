import 'package:air_pollution_app/core/shared/components/random_image_background_widget.dart';
import 'package:air_pollution_app/data/api/air_pollution_api.dart';
import 'package:air_pollution_app/features/details/repository/details_repository.dart';
import 'package:air_pollution_app/features/details/viewmodel/details_state.dart';
import 'package:air_pollution_app/features/details/viewmodel/details_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../../core/shared/components/days_list.dart';
import '../../../core/shared/components/loading_container.dart';
import '../components/card_details_header.dart';
import '../components/card_details_section.dart';
import '../../home/components/card_favorite/min_max_value.dart';

class LocationDetailsScreen extends StatefulWidget {
  const LocationDetailsScreen({super.key});

  @override
  State<LocationDetailsScreen> createState() => _LocationDetailsScreenState();
}

class _LocationDetailsScreenState extends State<LocationDetailsScreen> {
  late DetailsViewModel detailsViewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locationId = ModalRoute.of(context)?.settings.arguments as int;
    detailsViewModel = DetailsViewModel(
      locationId: locationId,
      detailsRepository: DetailsRepository(
        airPollutionApi: AirPollutionApi(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'QualiAr Brasil',
        ),
      ),
      body: RandomImageBackgroundWidget(
        child: ValueListenableBuilder(
          valueListenable: detailsViewModel.state,
          builder: (context, state, _) {
            switch (state) {
              case Loading():
                return const LoadingContainer();
              case Reender():
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            CardDetailsHeader(
                              detailsData: state.data,
                            ),
                            CardDetailsSection(
                              title: 'Mínimo e máximo do dia',
                              child: Row(
                                children: [
                                  Expanded(
                                    child: MinMaxValue(
                                      title: 'Min.',
                                      value: state.data.values.min,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: MinMaxValue(
                                      title: 'Max.',
                                      value: state.data.values.max,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CardDetailsSection(
                              title: 'Últimos 5 dias',
                              child: DaysList(
                                days: state.data.previousDays,
                              ),
                            ),
                            CardDetailsSection(
                              title: 'Próximos 5 dias',
                              child: DaysList(
                                days: state.data.nextDays,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
