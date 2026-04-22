import 'dart:convert';

StoriesModel stroiesModelFromJson(String str) => StoriesModel.fromJson(json.decode(str));


class StoriesModel {
  final int count;
  final String? next;
  final String? previous;
  final List<Result> results;

  StoriesModel({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory StoriesModel.fromJson(Map<String, dynamic> json) => StoriesModel(
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
  final String coverImage;
  final String storyType;
  final bool isSeen;
  final DateTime createdAt;

  Result({
    required this.id,
    required this.title,
    required this.coverImage,
    required this.storyType,
    required this.isSeen,
    required this.createdAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"] ?? 0,
    title: json["title"] ?? "",
    coverImage: json["cover_image"] ?? "",
    storyType: json["story_type"] ?? "unknown",
    isSeen: json["is_seen"] ?? false,
    createdAt: json["created_at"] != null
        ? DateTime.parse(json["created_at"])
        : DateTime.now(),
  );

}