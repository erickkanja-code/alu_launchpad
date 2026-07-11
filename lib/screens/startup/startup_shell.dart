import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartupShell extends StatelessWidget {
  final Widget child;
  const StartupShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final path = GoRouterState.of(context).uri.path;
    final isProfile = path.startsWith('/startup/profile');

    return Scaffold(
      body: child,
      floatingActionButton: isProfile
          ? null
          : FloatingActionButton(
              onPressed: () => context.push('/startup/new-internship'),
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const Icon(Icons.add, color: Colors.white),
            ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _StartupBottomNav(isProfile: isProfile),
    );
  }
}

class _StartupBottomNav extends StatelessWidget {
  final bool isProfile;
  const _StartupBottomNav({required this.isProfile});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6,
      color: Colors.white,
      elevation: 8,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => context.go('/startup/dashboard'),
              child: _NavItem(
                icon: isProfile
                    ? Icons.dashboard_outlined
                    : Icons.dashboard,
                label: 'Dashboard',
                isActive: !isProfile,
              ),
            ),
            const SizedBox(width: 48),
            GestureDetector(
              onTap: () => context.go('/startup/profile'),
              child: _NavItem(
                icon: isProfile ? Icons.person : Icons.person_outline,
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