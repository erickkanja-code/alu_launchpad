import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartupProfileScreen extends StatelessWidget {
  const StartupProfileScreen({super.key});

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
      ),
      bottomNavigationBar: _BottomNav(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ProfileCard(),
            const SizedBox(height: 12),
            _StatCard(label: 'Active Postings', value: '3'),
            const SizedBox(height: 12),
            _StatCard(label: 'Applications', value: '12'),
            const SizedBox(height: 12),
            _StatCard(label: 'Rating', value: '4.8'),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _AvatarPlaceholder(),
          const SizedBox(height: 12),
          Text(
            'Acme Innovations',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          _PendingVerificationBadge(),
          const SizedBox(height: 12),
          _CompanyDetails(),
          const SizedBox(height: 16),
          _AboutSection(),
          const SizedBox(height: 16),
          _EditProfileButton(),
        ],
      ),
    );
  }
}

class _AvatarPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Icon(
        Icons.auto_awesome,
        color: Colors.grey.shade400,
        size: 32,
      ),
    );
  }
}

class _PendingVerificationBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.red.shade600,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.shield_outlined, color: Colors.white, size: 14),
          const SizedBox(width: 6),
          Text(
            'PENDING VERIFICATION',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
          ),
        ],
      ),
    );
  }
}

class _CompanyDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _IconLabel(
              icon: Icons.business_outlined,
              label: 'SaaS / Enterprise',
            ),
            const SizedBox(width: 16),
            _IconLabel(
              icon: Icons.location_on_outlined,
              label: 'Kigali, Rwanda',
            ),
          ],
        ),
        const SizedBox(height: 8),
        _IconLabel(
          icon: Icons.people_outline,
          label: '10-50 Employees',
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
          'About Us',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Acme Innovations is pioneering the next generation of cloud-based enterprise solutions for emerging markets. We focus on building scalable, accessible tools that empower local businesses to compete globally. Currently seeking driven engineering and product talent to help accelerate our growth phase.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade700,
                height: 1.6,
              ),
        ),
      ],
    );
  }
}

class _EditProfileButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          // edit profile logic comes later
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        icon: const Icon(Icons.edit_outlined, color: Colors.white, size: 18),
        label: Text(
          'Edit Profile',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;

  const _StatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
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
            _NavItem(
              icon: Icons.person,
              isActive: true,
            ),
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
      color: isActive
          ? Theme.of(context).colorScheme.primary
          : Colors.grey,
      size: 28,
    );
  }
}