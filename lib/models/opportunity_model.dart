// lib/models/opportunity_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class OpportunityModel {
  final String id;
  final String title;
  final String description;
  final String category;
  final String location;
  final String duration;
  final String requirements;
  final String startupId;
  final String startupName;
  final String status;
  final DateTime createdAt;

  OpportunityModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.location,
    required this.duration,
    required this.requirements,
    required this.startupId,
    required this.startupName,
    required this.status,
    required this.createdAt,
  });

  factory OpportunityModel.fromMap(Map<String, dynamic> map) {
    return OpportunityModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      location: map['location'] ?? '',
      duration: map['duration'] ?? '',
      requirements: map['requirements'] ?? '',
      startupId: map['startupId'] ?? '',
      startupName: map['startupName'] ?? '',
      status: map['status'] ?? 'open',
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'location': location,
      'duration': duration,
      'requirements': requirements,
      'startupId': startupId,
      'startupName': startupName,
      'status': status,
      'createdAt': createdAt,
    };
  }
}