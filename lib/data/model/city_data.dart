class CityData {
  final int id;
  final String name;
  final String uf;

  CityData({
    required this.id,
    required this.name,
    required this.uf,
  });

  CityData.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int,
      name = json['name'],
      uf = json['uf'];
}