// lib/models/student_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentModel {
  final String uid;
  final String name;
  final String year;
  final String skills;
  final String bio;
  final DateTime createdAt;

  StudentModel({
    required this.uid,
    required this.name,
    required this.year,
    required this.skills,
    required this.bio,
    required this.createdAt,
  });

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      year: map['year'] ?? '',
      skills: map['skills'] ?? '',
      bio: map['bio'] ?? '',
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'year': year,
      'skills': skills,
      'bio': bio,
      'createdAt': createdAt,
    };
  }
}