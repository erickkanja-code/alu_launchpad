import 'package:flutter/material.dart';
import 'package:alu_launchpad/route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/opportunity_provider.dart';
import 'providers/application_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final authProvider = AuthProvider();
  await authProvider.initialize();

  runApp(MyApp(authProvider: authProvider));}

class MyApp extends StatelessWidget {
  final AuthProvider authProvider;
  const MyApp({super.key, required this.authProvider});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: authProvider),
        ChangeNotifierProvider(create: (_) => OpportunityProvider()),
        ChangeNotifierProvider(create: (_) => ApplicationProvider()),
      ],
      child: MaterialApp.router(
      title: 'ALU Launchpad',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF0052cc)),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            // fontFamily: 'Inter',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            height: 1.8,
            letterSpacing: 1.0,
            ),
          titleMedium: TextStyle(
            // fontFamily: 'Inter',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
          bodyMedium: TextStyle(
            // fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
          bodySmall: TextStyle(
            // fontFamily: 'Inter',
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 1.4,
          ),
        )
      ),
      routerConfig: appRouter,
    ),);
  }
}

