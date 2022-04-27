class SectionDetailsModel {
  int? sectionId;
  String? count;
  String? description;
  String? reference;
  String? content;

  SectionDetailsModel.fromJson(Map<String, dynamic> json) {
    sectionId = json['section_id'];
    count = json['count'];
    description = json['description'];
    reference = json['reference'];
    content = json['content'];
  }
}
