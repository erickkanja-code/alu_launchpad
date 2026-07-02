import 'package:flutter/material.dart';

class InternshipDetailScreen extends StatelessWidget {
  final String opportunityId;
  const InternshipDetailScreen({super.key, required this.opportunityId});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Internship details')),
      body: Center(child: Text('Internship details')),
    );
  }
}