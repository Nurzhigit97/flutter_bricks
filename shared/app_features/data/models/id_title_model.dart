class IdTitleModel {
  final String id;
  final String title;

  IdTitleModel({required this.id, required this.title});

  factory IdTitleModel.fromJson(Map<String, dynamic> json) {
    return IdTitleModel(id: json['id'], title: json['title']);
  }
}
