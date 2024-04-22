class DaysData {
  final String day;
  final double value;

  DaysData({
    required this.day,
    required this.value,
  });

  DaysData.fromJson(Map<String, dynamic> json)
      : day = json['day'],
        value = double.tryParse(json['value'].toString()) ?? 0.0;

  static List<DaysData> fromJsonList(List json) {
    return json.map(
      (day) => DaysData.fromJson(day),
    ).toList();
  }
}
