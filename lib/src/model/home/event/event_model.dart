import 'dart:convert';

EventModel eventModelFromJson(String str) => EventModel.fromJson(json.decode(str));
class EventModel {
  final int count;
  final String? next;
  final String? previous;
  final List<EventResult> results;

  EventModel({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
    count: json["count"] ?? 0,
    next: json["next"],
    previous: json["previous"],
    results: json["results"] == null
        ? []
        : List<EventResult>.from(json["results"].map((x) => EventResult.fromJson(x))),
  );
}

class EventResult {
  final int id;
  final String title;
  final String description;
  final String coverImage;
  final DateTime startDatetime;
  final DateTime endDatetime;
  final String branchName;
  final String status;

  EventResult({
    required this.id,
    required this.title,
    required this.description,
    required this.coverImage,
    required this.startDatetime,
    required this.endDatetime,
    required this.branchName,
    required this.status,
  });

  factory EventResult.fromJson(Map<String, dynamic> json) => EventResult(
    id: json["id"] ?? 0,
    title: json["title"] ?? "",
    description: json["description"] ?? "",
    coverImage: json["cover_image"] ?? "",
    startDatetime: json["start_datetime"] != null
        ? DateTime.parse(json["start_datetime"])
        : DateTime.now(),
    endDatetime: json["end_datetime"] != null
        ? DateTime.parse(json["end_datetime"])
        : DateTime.now(),
    branchName: json["branch_name"] ?? "Noma'lum filial",
    status: json["status"] ?? "unknown",
  );
}