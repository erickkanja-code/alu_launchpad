import 'package:flutter/material.dart';
import 'package:alu_launchpad/route.dart';
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

  final opportunityProvider = OpportunityProvider();

  // if user was already logged in from a previous session, start the stream
  if (authProvider.isLoggedIn) {
    final uid = authProvider.currentUser!.uid;
    final role = authProvider.role;
    if (role == 'startup') {
      opportunityProvider.listenToStartupOpportunities(uid);
    } else {
      opportunityProvider.listenToOpportunities();
    }
  }

  runApp(MyApp(
    authProvider: authProvider,
    opportunityProvider: opportunityProvider,
  ));
}

class MyApp extends StatelessWidget {
  final AuthProvider authProvider;
  final OpportunityProvider opportunityProvider;

  const MyApp({
    super.key,
    required this.authProvider,
    required this.opportunityProvider,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: authProvider),
        ChangeNotifierProvider.value(value: opportunityProvider),
        ChangeNotifierProvider(create: (_) => ApplicationProvider()),
      ],
      child: MaterialApp.router(
        title: 'ALU Launchpad',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0052cc)),
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              height: 1.8,
              letterSpacing: 1.0,
            ),
            titleMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
            bodyMedium: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
            bodySmall: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),
        ),
        routerConfig: appRouter,
      ),
    );
  }
}