class WorldCityData {
  final int id;
  final String city;
  final String country;
  final double value;

  WorldCityData({
    required this.id,
    required this.city,
    required this.country,
    required this.value,
  });

  WorldCityData.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        city = json['city'].toString(),
        country = json['country'].toString(),
        value = double.tryParse(json['value'].toString()) ?? 0.0;

  static List<WorldCityData> fromJsonList(List json) {
    return json
        .map(
          (otherLocation) => WorldCityData.fromJson(otherLocation),
        ).toList();
  }
}