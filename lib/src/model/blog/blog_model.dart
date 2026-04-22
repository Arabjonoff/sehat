import 'dart:convert';

BlogModel blogModelFromJson(String str) => BlogModel.fromJson(json.decode(str));

class BlogModel {
  final int count;
  final String? next;
  final String? previous;
  final List<Result> results;

  BlogModel({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
    count: json["count"] ?? 0,
    next: json["next"],
    previous: json["previous"],
    results: json["results"] == null
        ? []
        : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

}

class Result {
  final int id;
  final String title;
  final String description;
  final String coverImage;
  final String authorName;
  final int views;
  final DateTime publishedAt;
  final DateTime createdAt;

  Result({
    required this.id,
    required this.title,
    required this.description,
    required this.coverImage,
    required this.authorName,
    required this.views,
    required this.publishedAt,
    required this.createdAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"] ?? 0,
    title: json["title"] ?? "Sarlavha yo'q",
    description: json["description"] ?? "",
    coverImage: json["cover_image"] ?? "",
    authorName: json["author_name"] ?? "Noma'lum muallif",
    views: json["views"] ?? 0,
    publishedAt: json["published_at"] != null
        ? DateTime.parse(json["published_at"])
        : DateTime.now(),
    createdAt: json["created_at"] != null
        ? DateTime.parse(json["created_at"])
        : DateTime.now(),
  );

}