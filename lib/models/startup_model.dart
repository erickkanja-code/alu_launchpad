// lib/models/startup_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class StartupModel {
  final String uid;
  final String name;
  final String description;
  final String industry;
  final String location;
  final String employees;
  final bool verified;
  final DateTime createdAt;

  StartupModel({
    required this.uid,
    required this.name,
    required this.description,
    required this.industry,
    required this.location,
    required this.employees,
    required this.verified,
    required this.createdAt,
  });

  factory StartupModel.fromMap(Map<String, dynamic> map) {
    return StartupModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      industry: map['industry'] ?? '',
      location: map['location'] ?? '',
      employees: map['employees'] ?? '',
      verified: map['verified'] ?? false,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'description': description,
      'industry': industry,
      'location': location,
      'employees': employees,
      'verified': verified,
      'createdAt': createdAt,
    };
  }
}