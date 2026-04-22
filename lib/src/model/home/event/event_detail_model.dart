import 'dart:convert';

EventDetailModel eventDetailModelFromJson(String str) => EventDetailModel.fromJson(json.decode(str));

class EventDetailModel {
  final int id;
  final String title;
  final String description;
  final DateTime startDatetime;
  final DateTime endDatetime;
  final Branch? branch;
  final String eventType;
  final int applicationLimit;
  final int applicationsCount;
  final bool isFull;
  final bool isExpired;
  final String status;

  EventDetailModel({
    required this.id,
    required this.title,
    required this.description,
    required this.startDatetime,
    required this.endDatetime,
    this.branch,
    required this.eventType,
    required this.applicationLimit,
    required this.applicationsCount,
    required this.isFull,
    required this.isExpired,
    required this.status,
  });

  factory EventDetailModel.fromJson(Map<String, dynamic> json) => EventDetailModel(
    id: json["id"] ?? 0,
    title: json["title"] ?? "",
    description: json["description"] ?? "",
    startDatetime: json["start_datetime"] != null
        ? DateTime.parse(json["start_datetime"])
        : DateTime.now(),
    endDatetime: json["end_datetime"] != null
        ? DateTime.parse(json["end_datetime"])
        : DateTime.now(),
    branch: json["branch"] == null ? null : Branch.fromJson(json["branch"]),
    eventType: json["event_type"] ?? "unknown",
    applicationLimit: json["application_limit"] ?? 0,
    applicationsCount: json["applications_count"] ?? 0,
    isFull: json["is_full"] ?? false,
    isExpired: json["is_expired"] ?? false,
    status: json["status"] ?? "unknown",
  );

}

class Branch {
  final int id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;

  Branch({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    address: json["address"] ?? "",
    latitude: (json["latitude"] ?? 0.0).toDouble(),
    longitude: (json["longitude"] ?? 0.0).toDouble(),
  );

}