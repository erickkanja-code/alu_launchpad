import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class InternshipDetailScreen extends StatelessWidget {
  final String opportunityId;
  const InternshipDetailScreen({super.key, required this.opportunityId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: Text(
          'ALU Launchpad',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(
              Icons.code,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
      bottomNavigationBar: _BottomNav(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _InternshipHeader(),
            const SizedBox(height: 20),
            _MetaRow(),
            const SizedBox(height: 24),
            _AboutSection(),
            const SizedBox(height: 24),
            _RequirementsSection(),
            const SizedBox(height: 24),
            _ApplicantsSection(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _InternshipHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            'Software Engineering',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Frontend Developer Intern',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 6),
        Text(
          'TechFlow Innovations',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}

class _MetaRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _IconLabel(
          icon: Icons.location_on_outlined,
          label: 'Kigali, Rwanda (Hybrid)',
        ),
        const SizedBox(width: 16),
        _IconLabel(
          icon: Icons.access_time_outlined,
          label: '3 Months',
        ),
        const SizedBox(width: 16),
        _IconLabel(
          icon: Icons.attach_money_outlined,
          label: 'Paid Stipend',
        ),
      ],
    );
  }
}

class _AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About the Role',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 10),
        Text(
          'We are looking for an enthusiastic Frontend Developer Intern to join our product team. You will work closely with our designers and senior developers to build robust, scalable user interfaces for our flagship SaaS product.\n\nThis is a hands-on role where you will be writing production code, participating in code reviews, and learning modern web development practices in a fast-paced startup environment.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade700,
                height: 1.6,
              ),
        ),
      ],
    );
  }
}

class _RequirementsSection extends StatelessWidget {
  final List<String> _requirements = const [
    'Proficiency in HTML, CSS, and modern JavaScript (ES6+).',
    'Experience with React.js or Vue.js framework.',
    'Familiarity with version control systems (Git).',
    'Strong problem-solving skills and a willingness to learn.',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Requirements',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        Column(
          children: _requirements
              .map(
                (req) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: Theme.of(context).colorScheme.primary,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          req,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey.shade700,
                                    height: 1.5,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _ApplicantsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            'Current Status',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            '12 Applicants',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                context.push('/startup/applicants-list/:opportunityId');
                // navigate to applicants list - Day 6
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const Icon(Icons.people_outline,
                  color: Colors.white, size: 18),
              label: Text(
                'View Applicants',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ),
        ],
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
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey.shade700,
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
      notchMargin: 8,
      color: Colors.white,
      elevation: 4,
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
            const SizedBox(width: 48),
            GestureDetector(
              onTap: () {
                context.push('/startup/startup-profile');
              },
              child: _NavItem(
              icon: Icons.person_outline,
              isActive: false,
            ),)          ],
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