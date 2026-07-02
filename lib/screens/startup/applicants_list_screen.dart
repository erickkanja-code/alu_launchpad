import 'package:flutter/material.dart';

class ApplicantsListScreen extends StatelessWidget {
  final String opportunityId;
  const ApplicantsListScreen({super.key, required this.opportunityId});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Applicants List Screen')),
      body: Center(child: Text('Applicants List Screen')),
    );
  }
}