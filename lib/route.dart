import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'screens/auth/create_account_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/shared/internship_detail_screen.dart';
import 'screens/startup/applicant_detail_screen.dart';
import 'screens/startup/applicants_list_screen.dart';
import 'screens/startup/dashboard_screen.dart';
import 'screens/startup/edit_startup_profile_screen.dart';
import 'screens/startup/new_internship_screen.dart';
import 'screens/startup/startup_profile_screen.dart';
import 'screens/student/apply_form_screen.dart';
import 'screens/student/discover_screen.dart';
import 'screens/student/my_applications_screen.dart';
import 'screens/student/student_profile_screen.dart';
import 'screens/startup/edit_internship_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  redirect: (context, state) {
    final auth = context.read<AuthProvider>();
    final isLoggedIn = auth.isLoggedIn;
    final path = state.uri.path;
    final isAuthRoute =
        path == '/login' || path == '/create-account';

    if (!isLoggedIn && !isAuthRoute) return '/login';
    if (isLoggedIn && isAuthRoute) {
      return auth.role == 'startup'
          ? '/startup/dashboard'
          : '/student/discover';
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/create-account',
      builder: (context, state) => const CreateAccountScreen(),
    ),
    GoRoute(
      path: '/startup/dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: '/startup/profile',
      builder: (context, state) => const StartupProfileScreen(),
    ),
    GoRoute(
      path: '/startup/edit-profile',
      builder: (context, state) => const EditStartupProfileScreen(),
    ),
    GoRoute(
      path: '/startup/new-internship',
      builder: (context, state) => const NewInternshipScreen(),
    ),
    GoRoute(
      path: '/startup/applicants/:opportunityId',
      builder: (context, state) => ApplicantsListScreen(
        opportunityId: state.pathParameters['opportunityId']!,
      ),
    ),
    GoRoute(
      path: '/startup/applicant-detail/:applicationId',
      builder: (context, state) => ApplicantDetailScreen(
        applicationId: state.pathParameters['applicationId']!,
      ),
    ),
    GoRoute(
      path: '/internship-detail/:id',
      builder: (context, state) => InternshipDetailScreen(
        opportunityId: state.pathParameters['id']!,
      ),
    ),
    GoRoute(
      path: '/student/discover',
      builder: (context, state) => const DiscoverScreen(),
    ),
    GoRoute(
      path: '/student/profile',
      builder: (context, state) => const StudentProfileScreen(),
    ),
GoRoute(
  path: '/startup/edit-internship/:id',
  builder: (context, state) => EditInternshipScreen(
    opportunityId: state.pathParameters['id']!,
  ),
),
    GoRoute(
      path: '/student/applications',
      builder: (context, state) => const MyApplicationsScreen(),
    ),
    GoRoute(
      path: '/student/apply/:opportunityId',
      builder: (context, state) => ApplyFormScreen(
        opportunityId: state.pathParameters['opportunityId']!,
      ),
    ),
  ],
);