class SectionModel {
  int? id;
  String? name;

  SectionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
