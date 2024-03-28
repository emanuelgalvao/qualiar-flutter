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
      case AirPollutionLevel.unknown:
        return Colors.white;
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
      case AirPollutionLevel.unknown:
        return 'Desconhecido';
    }
  }

  String get description {
    switch (this) {
      case AirPollutionLevel.good:
        return 'A qualidade do ar é considerada satisfatória e a poluição atmosférica representa pouco ou nenhum risco.';
      case AirPollutionLevel.moderate:
        return 'Moderado	A qualidade do ar é aceitável, no entanto, para alguns poluentes, pode haver um problema moderado de saúde para um número muito pequeno de pessoas que são invulgarmente sensíveis à poluição atmosférica.';
      case AirPollutionLevel.unhealthyForSensitiveGroups:
        return 'Membros de grupos sensíveis podem sofrer efeitos na saúde. O público em geral provavelmente não será afetado.';
      case AirPollutionLevel.unhealthy:
        return 'Todos podem começar a sentir efeitos na saúde; membros de grupos sensíveis podem sofrer efeitos mais graves para a saúde.';
      case AirPollutionLevel.veryUnhealthy:
        return 'Advertências de saúde sobre condições de emergência. Toda a população tem maior probabilidade de ser afetada.';
      case AirPollutionLevel.hazardous:
        return 'Alerta de saúde: todos podem sofrer efeitos mais graves para a saúde.';
      case AirPollutionLevel.unknown:
        return '';
    }
  }

  String get valuesRange {
    switch (this) {
      case AirPollutionLevel.good:
        return '0-50';
      case AirPollutionLevel.moderate:
        return '51-100';
      case AirPollutionLevel.unhealthyForSensitiveGroups:
        return '101-150';
      case AirPollutionLevel.unhealthy:
        return '151-200';
      case AirPollutionLevel.veryUnhealthy:
        return '201-300';
      case AirPollutionLevel.hazardous:
        return '300+';
      case AirPollutionLevel.unknown:
        return '';
    }
  }
}

extension AirPollutionLevelValidation on double {
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
    if (this == 0) {
      return AirPollutionLevel.unknown;
    }
    return AirPollutionLevel.good;
  }
}