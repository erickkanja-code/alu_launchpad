import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        // leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: Text(
          'ALU Launchpad',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/startup/new-internship');
          // navigate to new internship screen - Day 6
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _BottomNav(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _WelcomeSection(),
            const SizedBox(height: 20),
            _StatCards(),
            const SizedBox(height: 24),
            _PostedInternshipsSection(),
          ],
        ),
      ),
    );
  }
}

class _WelcomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Welcome, TechNova Inc.',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(width: 8),
            _VerifiedBadge(),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          'Here is a summary of your talent pipeline.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey,
              ),
        ),
      ],
    );
  }
}

class _VerifiedBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.verified, color: Colors.white, size: 12),
          const SizedBox(width: 4),
          Text(
            'Verified',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}

class _StatCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatCard(
            label: 'Total Opportunities',
            value: '12',
            icon: Icons.work_outline,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatCard(
            label: 'Total Applicants',
            value: '48',
            icon: Icons.people_outline,
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey,
                    ),
              ),
              Icon(icon, size: 16, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}

class _PostedInternshipsSection extends StatelessWidget {
  final List<Map<String, dynamic>> _internships = const [
    {
      'title': 'Frontend Developer Intern',
      'category': 'Software Engineering',
      'location': 'Remote',
      'duration': '3 Months',
      'applicants': 24,
      'status': 'Open',
    },
    {
      'title': 'Product Design Intern',
      'category': 'Design & UX',
      'location': 'Kigali, Rwanda',
      'duration': '6 Months',
      'applicants': 18,
      'status': 'Open',
    },
    {
      'title': 'Data Analyst Intern',
      'category': 'Data Science',
      'location': 'Hybrid',
      'duration': '3 Months',
      'applicants': 6,
      'status': 'Closed',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Posted Internships',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              'View All',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Column(
          children: _internships
              .map((internship) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: GestureDetector(onTap: () {context.push('/internshipdetail/:opportunityId');},child: _InternshipCard(internship: internship),),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class _InternshipCard extends StatelessWidget {
  final Map<String, dynamic> internship;

  const _InternshipCard({required this.internship});

  @override
  Widget build(BuildContext context) {
    final bool isOpen = internship['status'] == 'Open';

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  internship['title'],
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(width: 8),
              _StatusBadge(isOpen: isOpen),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            internship['category'],
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _IconLabel(
                icon: Icons.location_on_outlined,
                label: internship['location'],
              ),
              const SizedBox(width: 16),
              _IconLabel(
                icon: Icons.access_time_outlined,
                label: internship['duration'],
              ),
              const SizedBox(width: 16),
              _IconLabel(
                icon: Icons.people_outline,
                label: '${internship['applicants']} Applicants',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final bool isOpen;

  const _StatusBadge({required this.isOpen});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isOpen
            ? Theme.of(context).colorScheme.primary
            : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        isOpen ? 'Open' : 'Closed',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: isOpen ? Colors.white : Colors.grey.shade700,
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
                color: Colors.grey,
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
      shape: const CircularNotchedRectangle(),
      notchMargin: 4,
      color: Colors.white,
      // elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
            onTap: () {
              context.push('/');
            },
            child: _NavItem(
              icon: Icons.dashboard_outlined,
              isActive: true,
            ),),
            const SizedBox(width: 8), // space for FAB
            GestureDetector(
              onTap: () {
                context.push('/startup/startup-profile');
              },
              child: _NavItem(
              icon: Icons.person_outline,
              isActive: false,
            ),)
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final bool isActive;

  const _NavItem({
    required this.icon,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive
        ? Theme.of(context).colorScheme.primary
        : Colors.grey;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
      ],
    );
  }
}