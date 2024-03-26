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
}
