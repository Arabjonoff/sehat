import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));


class NewsModel {
  final int count;
  final String? next;
  final String? previous;
  final List<Result> results;

  NewsModel({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
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
  final String coverImage; // dynamic -> String
  final int views;
  final DateTime createdAt;

  Result({
    required this.id,
    required this.title,
    required this.description,
    required this.coverImage,
    required this.views,
    required this.createdAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"] ?? 0,
    title: json["title"] ?? "",
    description: json["description"] ?? "",
    coverImage: json["cover_image"] ?? "",
    views: json["views"] ?? 0,
    createdAt: json["created_at"] != null
        ? DateTime.parse(json["created_at"])
        : DateTime.now(),
  );

}