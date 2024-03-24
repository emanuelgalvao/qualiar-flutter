import 'package:air_pollution_app/utils/air_pollution_level.dart';
import 'package:flutter/material.dart';

extension ScreenData on AirPollutionLevel {
  Color get color {
    switch (this) {
      case AirPollutionLevel.good:
        return Colors.green;
      case AirPollutionLevel.moderate:
        return Colors.yellow;
      case AirPollutionLevel.unhealthyForSensitiveGroups:
        return Colors.orange;
      case AirPollutionLevel.unhealthy:
        return Colors.red;
      case AirPollutionLevel.veryUnhealthy:
        return Colors.purple;
      case AirPollutionLevel.hazardous:
        return Colors.black;
    }
  }

  String get message {
    switch (this) {
      case AirPollutionLevel.good:
        return 'Bom';
      case AirPollutionLevel.moderate:
        return 'Moderado';
      case AirPollutionLevel.unhealthyForSensitiveGroups:
        return 'Não saudável para grupos sensíveis';
      case AirPollutionLevel.unhealthy:
        return 'Pouco saudável';
      case AirPollutionLevel.veryUnhealthy:
        return 'Muito prejudicial à saúde';
      case AirPollutionLevel.hazardous:
        return 'Perigoso';
    }
  }
}

extension AirPollutionLevelValidation on int {
  AirPollutionLevel get airPollutionLevel {
    if (this > 300) {
      return AirPollutionLevel.hazardous;
    }
    if (this > 200 && this <= 300) {
      return AirPollutionLevel.veryUnhealthy;
    }
    if (this > 150 && this <= 200) {
      return AirPollutionLevel.unhealthy;
    }
    if (this > 100 && this <= 150) {
      return AirPollutionLevel.unhealthyForSensitiveGroups;
    }
    if (this > 50 && this <= 100) {
      return AirPollutionLevel.moderate;
    }
    return AirPollutionLevel.good;
  }
}