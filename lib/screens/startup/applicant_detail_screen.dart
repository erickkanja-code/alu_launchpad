import 'package:flutter/material.dart';

class ApplicantDetailScreen extends StatelessWidget {
  const ApplicantDetailScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Applicant Detail Screen')),
      body: Center(child: Text('Applicant Details')),
    );
  }
}