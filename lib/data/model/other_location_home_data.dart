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

  OtherLocationHomeData.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'].toString(),
        uf = json['uf'].toString(),
        value = double.tryParse(json['value'].toString()) ?? 0.0;

  static List<OtherLocationHomeData> fromJsonList(List json) {
    return json
        .map(
          (otherLocation) => OtherLocationHomeData.fromJson(otherLocation),
        ).toList();
  }
}
