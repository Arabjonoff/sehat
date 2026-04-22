import 'dart:convert';

BlogDetailModel blogDetailModelFromJson(String str) => BlogDetailModel.fromJson(json.decode(str));
class BlogDetailModel {
  final int id;
  final String title;
  final String description;
  final String coverImage;
  final String content;
  final String authorName;
  final String authorPosition;
  final int views;
  final DateTime publishedAt;
  final DateTime createdAt;

  BlogDetailModel({
    required this.id,
    required this.title,
    required this.description,
    required this.coverImage,
    required this.content,
    required this.authorName,
    required this.authorPosition,
    required this.views,
    required this.publishedAt,
    required this.createdAt,
  });

  factory BlogDetailModel.fromJson(Map<String, dynamic> json) => BlogDetailModel(
    id: json["id"] ?? 0,
    title: json["title"] ?? "",
    description: json["description"] ?? "",
    coverImage: json["cover_image"] ?? "",
    content: json["content"] ?? "",
    authorName: json["author_name"] ?? "Noma'lum muallif",
    authorPosition: json["author_position"] ?? "",
    views: json["views"] ?? 0,
    publishedAt: json["published_at"] != null
        ? DateTime.parse(json["published_at"])
        : DateTime.now(),
    createdAt: json["created_at"] != null
        ? DateTime.parse(json["created_at"])
        : DateTime.now(),
  );
}