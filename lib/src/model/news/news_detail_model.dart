import 'dart:convert';

NewsDetailModel newsDetailModelFromJson(String str) => NewsDetailModel.fromJson(json.decode(str));


class NewsDetailModel {
  final int id;
  final String title;
  final String description;
  final String coverImage;
  final int views;
  final DateTime createdAt;
  final DateTime updatedAt;

  NewsDetailModel({
    required this.id,
    required this.title,
    required this.description,
    required this.coverImage,
    required this.views,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NewsDetailModel.fromJson(Map<String, dynamic> json) => NewsDetailModel(
    id: json["id"] ?? 0,
    title: json["title"] ?? "",
    description: json["description"] ?? "",
    coverImage: json["cover_image"] ?? "",
    views: json["views"] ?? 0,
    createdAt: json["created_at"] != null
        ? DateTime.parse(json["created_at"])
        : DateTime.now(),
    updatedAt: json["updated_at"] != null
        ? DateTime.parse(json["updated_at"])
        : DateTime.now(),
  );

}