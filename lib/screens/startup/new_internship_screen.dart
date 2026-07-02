import 'package:flutter/material.dart';

class NewInternshipScreen extends StatelessWidget {
  const NewInternshipScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Internship')),
      body: Center(child: Text('New internship')),
    );
  }
}