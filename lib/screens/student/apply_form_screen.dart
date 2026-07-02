import 'package:flutter/material.dart';

class ApplyFormScreen extends StatelessWidget {
  final String opportunityId;
  const ApplyFormScreen({super.key, required this.opportunityId});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Apply Form Screen')),
      body: Center(child: Text('Apply Form')),
    );
  }
}