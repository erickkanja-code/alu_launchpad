import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StudentShell extends StatelessWidget {
  final Widget child;
  const StudentShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: _StudentBottomNav(),
    );
  }
}

class _StudentBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final path = GoRouterState.of(context).uri.path;

    final isDiscover = path.startsWith('/student/discover');
    final isApplications = path.startsWith('/student/applications');
    final isProfile = path.startsWith('/student/profile');

    return BottomAppBar(
      color: Colors.white,
      elevation: 8,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => context.go('/student/discover'),
              child: _NavItem(
                icon: isDiscover
                    ? Icons.explore
                    : Icons.explore_outlined,
                label: 'Discover',
                isActive: isDiscover,
              ),
            ),
            GestureDetector(
              onTap: () => context.go('/student/applications'),
              child: _NavItem(
                icon: isApplications
                    ? Icons.check_box
                    : Icons.check_box_outlined,
                label: 'Applications',
                isActive: isApplications,
              ),
            ),
            GestureDetector(
              onTap: () => context.go('/student/profile'),
              child: _NavItem(
                icon: isProfile
                    ? Icons.person
                    : Icons.person_outline,
                label: 'Profile',
                isActive: isProfile,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final color =
        isActive ? Theme.of(context).colorScheme.primary : Colors.grey;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 2),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: color,
                fontWeight: isActive
                    ? FontWeight.w600
                    : FontWeight.w400,
              ),
        ),
      ],
    );
  }
}