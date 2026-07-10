import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyApplicationsScreen extends StatelessWidget {
  const MyApplicationsScreen({super.key});

  final List<Map<String, dynamic>> _applications = const [
    {
      'title': 'Software Engineering Intern',
      'company': 'TechNova Solutions',
      'location': 'Kigali, Rwanda',
      'duration': '3 Months',
      'appliedDate': 'Applied: Oct 12, 2023',
      'status': 'Pending',
    },
    {
      'title': 'Data Analyst Intern',
      'company': 'Kigali Analytics Group',
      'location': 'Remote',
      'duration': '6 Months',
      'appliedDate': 'Applied: Sep 28, 2023',
      'status': 'Accepted',
    },
    {
      'title': 'Marketing Coordinator',
      'company': 'GrowthHub Africa',
      'location': 'Nairobi, Kenya',
      'duration': '3 Months',
      'appliedDate': 'Applied: Sep 15, 2023',
      'status': 'Rejected',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: Text(
          'ALU Launchpad',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: _BottomNav(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ScreenHeader(),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: _applications.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return _ApplicationCard(
                      application: _applications[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScreenHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Applications',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          'Track the status of your internship applications.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ],
    );
  }
}

class _ApplicationCard extends StatelessWidget {
  final Map<String, dynamic> application;

  const _ApplicationCard({required this.application});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  application['title'],
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(width: 8),
              _StatusBadge(status: application['status']),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            application['company'],
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _IconLabel(
                icon: Icons.location_on_outlined,
                label: application['location'],
              ),
              const SizedBox(width: 16),
              _IconLabel(
                icon: Icons.calendar_today_outlined,
                label: application['duration'],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Divider(color: Colors.grey.shade200, height: 1),
          const SizedBox(height: 10),
          Text(
            application['appliedDate'],
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey,
                ),
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;

  const _StatusBadge({required this.status});

  Color _backgroundColor() {
    switch (status) {
      case 'Accepted':
        return const Color(0xFF1A56DB);
      case 'Rejected':
        return Colors.red.shade50;
      default:
        return Colors.grey.shade100;
    }
  }

  Color _textColor() {
    switch (status) {
      case 'Accepted':
        return Colors.white;
      case 'Rejected':
        return Colors.red.shade600;
      default:
        return Colors.grey.shade600;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: _backgroundColor(),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: _textColor(),
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}

class _IconLabel extends StatelessWidget {
  final IconData icon;
  final String label;

  const _IconLabel({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey.shade600,
              ),
        ),
      ],
    );
  }
}

class _BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      elevation: 4,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(onTap: () {context.push('/student/discover');},child: _NavItem(
              icon: Icons.explore_outlined,
              label: 'Discover',
              isActive: false,
            ),),
            _NavItem(
              icon: Icons.check_box,
              label: 'Applications',
              isActive: true,
            ),
            GestureDetector(onTap: () {context.push('/student/studentprofile');},child: _NavItem(
              icon: Icons.person_outline,
              label: 'Profile',
              isActive: false,
            ),),
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
        Icon(icon, color: color, size: 12),
        const SizedBox(height: 2),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: color,
                fontWeight:
                    isActive ? FontWeight.w600 : FontWeight.w400,
              ),
        ),
      ],
    );
  }
}