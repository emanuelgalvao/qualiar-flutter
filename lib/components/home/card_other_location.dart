import 'package:air_pollution_app/model/home_data.dart';
import 'package:air_pollution_app/utils/app_icons.dart';
import 'package:air_pollution_app/utils/app_routes.dart';
import 'package:air_pollution_app/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../shared/glass_container.dart';

class CardOtherLocation extends StatelessWidget {
  final OtherLocationHomeData otherLocation;

  const CardOtherLocation({
    super.key,
    required this.otherLocation,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.locationDetails, arguments: otherLocation.id);
      },
      child: GlassContainer(
        margin: const EdgeInsets.only(top: 10),
        child: Container(
          margin: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              GlassContainer(
                color: otherLocation.value.airPollutionLevel.color,
                child: Container(
                  width: 100,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        otherLocation.value.toString(),
                        style: const TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        otherLocation.value.airPollutionLevel.message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  '${otherLocation.name}, ${otherLocation.uf}',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(
                AppIcons.go,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
