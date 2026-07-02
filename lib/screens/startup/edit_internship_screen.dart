import 'package:flutter/material.dart';

class EditInternshipScreen extends StatelessWidget {
  final String opportunityId;
  const EditInternshipScreen({super.key, required this.opportunityId});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Internship Screen')),
      body: Center(child: Text('Edit Internship')),
    );
  }
}