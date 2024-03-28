class LocationModel {
  final int id;
  final String name;
  final String uf;
  bool isFavorite;

  LocationModel({
    required this.id,
    required this.name,
    required this.uf,
    this.isFavorite = false,
  });

  LocationModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'],
        uf = json['uf'],
        isFavorite = json['isFavorite'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'uf': uf,
    'isFavorite': isFavorite
  };
}
