class ResponseModel {
  late List<Map<String, dynamic>> choices;
  late int created;
  late String id;
  late String model;
  late String object;
  late Map<String, dynamic> usage;

  ResponseModel({
    required this.choices,
    required this.created,
    required this.id,
    required this.model,
    required this.object,
    required this.usage,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      choices: List<Map<String, dynamic>>.from(json['choices'].map((x) => x)),
      created: json['created'],
      id: json['id'],
      model: json['model'],
      object: json['object'],
      usage: json['usage'],
    );
  }
}
