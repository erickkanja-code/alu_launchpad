import 'package:flutter/material.dart';

class ApplyFormScreen extends StatelessWidget {
  const ApplyFormScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Apply Form Screen')),
      body: Center(child: Text('Apply Form')),
    );
  }
}