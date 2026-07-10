// lib/models/application_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class ApplicationModel {
  final String id;
  final String opportunityId;
  final String opportunityTitle;
  final String startupId;
  final String startupName;
  final String studentId;
  final String studentName;
  final String motivation;
  final String roleInfo;
  final String portfolioLink;
  final String availability;
  final String locationPref;
  final String status;
  final DateTime createdAt;

  ApplicationModel({
    required this.id,
    required this.opportunityId,
    required this.opportunityTitle,
    required this.startupId,
    required this.startupName,
    required this.studentId,
    required this.studentName,
    required this.motivation,
    required this.roleInfo,
    required this.portfolioLink,
    required this.availability,
    required this.locationPref,
    required this.status,
    required this.createdAt,
  });

  factory ApplicationModel.fromMap(Map<String, dynamic> map) {
    return ApplicationModel(
      id: map['id'] ?? '',
      opportunityId: map['opportunityId'] ?? '',
      opportunityTitle: map['opportunityTitle'] ?? '',
      startupId: map['startupId'] ?? '',
      startupName: map['startupName'] ?? '',
      studentId: map['studentId'] ?? '',
      studentName: map['studentName'] ?? '',
      motivation: map['motivation'] ?? '',
      roleInfo: map['roleInfo'] ?? '',
      portfolioLink: map['portfolioLink'] ?? '',
      availability: map['availability'] ?? '',
      locationPref: map['locationPref'] ?? '',
      status: map['status'] ?? 'pending',
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'opportunityId': opportunityId,
      'opportunityTitle': opportunityTitle,
      'startupId': startupId,
      'startupName': startupName,
      'studentId': studentId,
      'studentName': studentName,
      'motivation': motivation,
      'roleInfo': roleInfo,
      'portfolioLink': portfolioLink,
      'availability': availability,
      'locationPref': locationPref,
      'status': status,
      'createdAt': createdAt,
    };
  }
}