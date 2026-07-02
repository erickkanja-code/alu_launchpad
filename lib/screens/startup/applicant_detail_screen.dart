import 'package:flutter/material.dart';

class ApplicantDetailScreen extends StatelessWidget {
  final String applicationId;
  const ApplicantDetailScreen({super.key, required this.applicationId});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Applicant Detail Screen')),
      body: Center(child: Text('Applicant Details')),
    );
  }
}