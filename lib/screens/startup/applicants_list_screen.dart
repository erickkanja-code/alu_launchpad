import 'package:flutter/material.dart';

class ApplicantsListScreen extends StatelessWidget {
  final String opportunityId;
  const ApplicantsListScreen({super.key, required this.opportunityId});

  final List<Map<String, dynamic>> _applicants = const [
    {
      'name': 'Elena Rodriguez',
      'course': 'BSc Computer Science',
      'year': 'Year 3',
      'status': 'Pending',
    },
    {
      'name': 'David Mensah',
      'course': 'BSc Software Engineering',
      'year': 'Year 4',
      'status': 'Accepted',
    },
    {
      'name': 'Sarah Chen',
      'course': 'BSc Information Tech',
      'year': 'Year 2',
      'status': 'Rejected',
    },
    {
      'name': 'Michael Osei',
      'course': 'BSc Computer Science',
      'year': 'Year 3',
      'status': 'Pending',
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
            const SizedBox(height: 16),
            _SearchBar(),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: _applicants.length,
                separatorBuilder: (context, index) => const Divider(
                  height: 1,
                  color: Color(0xFFEEEEEE),
                ),
                itemBuilder: (context, index) {
                  return _ApplicantTile(applicant: _applicants[index]);
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
          'Applicants for Software\nEngineering Intern',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          'Review and manage candidates for this position.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ],
    );
  }
}

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search applicants...',
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.tune, color: Colors.grey, size: 20),
        ),
      ],
    );
  }
}

class _ApplicantTile extends StatelessWidget {
  final Map<String, dynamic> applicant;

  const _ApplicantTile({required this.applicant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _Avatar(name: applicant['name']),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        applicant['name'],
                        style:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    _StatusBadge(status: applicant['status']),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '${applicant['course']} • ${applicant['year']}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.more_vert, color: Colors.grey, size: 20),
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final String name;

  const _Avatar({required this.name});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.15),
      child: Text(
        name[0].toUpperCase(),
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
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

class _BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      color: Colors.white,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _NavItem(icon: Icons.dashboard_outlined, isActive: false),
            const SizedBox(width: 48),
            _NavItem(icon: Icons.person_outline, isActive: false),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final bool isActive;

  const _NavItem({required this.icon, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: isActive ? Theme.of(context).colorScheme.primary : Colors.grey,
      size: 28,
    );
  }
}