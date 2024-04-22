class ValuesData {
  final double current;
  final double min;
  final double max;

  ValuesData({
    required this.current,
    required this.min,
    required this.max,
  });

  ValuesData.fromJson(Map<String, dynamic> json)
    : current = double.tryParse(json['current'].toString()) ?? 0.0,
      min = double.tryParse(json['min'].toString()) ?? 0.0,
      max = double.tryParse(json ['max'].toString()) ?? 0.0;
}