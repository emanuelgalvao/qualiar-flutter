class DetailsData {
  final CityData city;
  final ValuesData values;
  final List<DaysData> previousDays;
  final List<DaysData> nextDays;

  DetailsData({
    required this.city,
    required this.values,
    required this.previousDays,
    required this.nextDays,
  });
}

class HomeData {
  final FavoriteLocationHomeData favoriteLocation;
  final List<OtherLocationHomeData> otherLocations;

  HomeData({
    required this.favoriteLocation,
    required this.otherLocations,
  });
}

class FavoriteLocationHomeData {
  final CityData city;
  final ValuesData values;
  final List<DaysData> nextDays;

  FavoriteLocationHomeData({
    required this.city,
    required this.values,
    required this.nextDays,
  });
}

class CityData {
  final int id;
  final String name;
  final String uf;

  CityData({
    required this.id,
    required this.name,
    required this.uf,
  });
}

class ValuesData {
  final double current;
  final double min;
  final double max;

  ValuesData({
    required this.current,
    required this.min,
    required this.max,
  });
}

class DaysData {
  final String day;
  final double value;

  DaysData({
    required this.day,
    required this.value,
  });
}

class OtherLocationHomeData {
  final int id;
  final String name;
  final String uf;
  final double value;

  OtherLocationHomeData({
    required this.id,
    required this.name,
    required this.uf,
    required this.value,
  });
}
