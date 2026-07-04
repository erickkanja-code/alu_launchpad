import 'package:go_router/go_router.dart';
import 'package:alu_launchpad/screens/auth/create_account_screen.dart';
import 'package:alu_launchpad/screens/auth/login_screen.dart';
import 'package:alu_launchpad/screens/shared/internship_detail_screen.dart';
import 'package:alu_launchpad/screens/startup/applicant_detail_screen.dart';
import 'package:alu_launchpad/screens/startup/applicants_list_screen.dart';
import 'package:alu_launchpad/screens/startup/dashboard_screen.dart';
import 'package:alu_launchpad/screens/startup/edit_internship_screen.dart';
import 'package:alu_launchpad/screens/startup/new_internship_screen.dart';
import 'package:alu_launchpad/screens/startup/startup_profile_screen.dart';
import 'package:alu_launchpad/screens/student/apply_form_screen.dart';
import 'package:alu_launchpad/screens/student/discover_screen.dart';
import 'package:alu_launchpad/screens/student/my_applications_screen.dart';
import 'package:alu_launchpad/screens/student/student_profile_screen.dart';


final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => CreateAccountScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/internshipdetail/:opportunityId',
      builder: (context, state) => InternshipDetailScreen(opportunityId: state.pathParameters['opportunityId']!),
    ),
    GoRoute(
      path: '/startup/applicant-detail/:applicationId',
      builder: (context, state) => ApplicantDetailScreen(applicationId: state.pathParameters['applicationId']!),
    ),
    GoRoute(
      path: '/startup/applicants-list/:opportunityId',
      builder: (context, state) => ApplicantsListScreen(opportunityId: state.pathParameters['opportunityId']!),
    ),
    GoRoute(
      path: '/startup/dashboard',
      builder: (context, state) => DashboardScreen(),
    ),
    GoRoute(
      path: '/startup/edit-internship/:opportunityId',
      builder: (context, state) => EditInternshipScreen(opportunityId: state.pathParameters['opportunityId']!),
    ),
    GoRoute(
      path: '/startup/new-internship',
      builder: (context, state) => NewInternshipScreen(),
    ),
    GoRoute(
      path: '/startup/startup-profile',
      builder: (context, state) => StartupProfileScreen(),
    ),
    GoRoute(
      path: '/student/apply-form/:opportunityId',
      builder: (context, state) => ApplyFormScreen(opportunityId: state.pathParameters['opportunityId']!,),
    ),
    GoRoute(
      path: '/student/discover',
      builder: (context, state) => DiscoverScreen(),
    ),
    GoRoute(
      path: '/student/applications',
      builder: (context, state) => MyApplicationsScreen(),
    ),
    GoRoute(
      path: '/student/studentprofile',
      builder: (context, state) => StudentProfileScreen(),
    ),

  ],
);
