class FactsModel {
  final String fact;
  final int length;

  const FactsModel({
    required this.fact,
    required this.length,
  });

  factory FactsModel.fromJson(Map<String, dynamic> json) {
    return FactsModel(
      fact: json['fact'],
      length: json['length'],
    );
  }
}