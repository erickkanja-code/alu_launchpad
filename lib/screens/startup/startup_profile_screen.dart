import 'package:flutter/material.dart';

class StartupProfileScreen extends StatelessWidget {
  const StartupProfileScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Startup Profile Screen')),
      body: Center(child: Text('Startup profile')),
    );
  }
}