enum ContentType { blog, event, unknown }

class UniversalContentModel {
  final int id;
  final String title;
  final String description;
  final String? coverImage;
  final ContentType type;
  final String? authorName;
  final int? views;
  final DateTime? publishedAt;
  final DateTime? startDatetime;
  final DateTime? endDatetime;
  final String? branchName;
  final String? status;

  UniversalContentModel({
    required this.id,
    required this.title,
    required this.description,
    this.coverImage,
    required this.type,
    this.authorName,
    this.views,
    this.publishedAt,
    this.startDatetime,
    this.endDatetime,
    this.branchName,
    this.status,
  });

  factory UniversalContentModel.fromJson(Map<String, dynamic> json) {
    final isEvent = json.containsKey('branch_name');
    return UniversalContentModel(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      coverImage: json["cover_image"],
      type: isEvent ? ContentType.event : ContentType.blog,
      authorName: json["author_name"],
      views: json["views"],
      publishedAt: json["published_at"] != null ? DateTime.parse(json["published_at"]) : null,
      startDatetime: json["start_datetime"] != null ? DateTime.parse(json["start_datetime"]) : null,
      endDatetime: json["end_datetime"] != null ? DateTime.parse(json["end_datetime"]) : null,
      branchName: json["branch_name"],
      status: json["status"],
    );
  }
}