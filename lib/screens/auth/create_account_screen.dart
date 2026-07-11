import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../providers/opportunity_provider.dart';
import '../../services/auth_service.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _isStudent = true;
  bool _obscurePassword = true;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // student fields
  final _fullNameController = TextEditingController();

  // startup fields
  final _startupNameController = TextEditingController();
  final _industryController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? _selectedEmployeeRange;

  final List<String> _employeeRanges = [
    '1-10',
    '10-50',
    '50-100',
    '100-500',
    '500+',
  ];

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _fullNameController.dispose();
    _startupNameController.dispose();
    _industryController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _Header(),
              const SizedBox(height: 24),
              _RoleToggle(
                isStudent: _isStudent,
                onStudentTap: () => setState(() => _isStudent = true),
                onStartupTap: () => setState(() => _isStudent = false),
              ),
              const SizedBox(height: 24),
              _AccountForm(
                formKey: _formKey,
                isStudent: _isStudent,
                emailController: _emailController,
                passwordController: _passwordController,
                obscurePassword: _obscurePassword,
                onTogglePassword: () =>
                    setState(() => _obscurePassword = !_obscurePassword),
                fullNameController: _fullNameController,
                startupNameController: _startupNameController,
                industryController: _industryController,
                locationController: _locationController,
                descriptionController: _descriptionController,
                selectedEmployeeRange: _selectedEmployeeRange,
                employeeRanges: _employeeRanges,
                onEmployeeRangeChanged: (value) =>
                    setState(() => _selectedEmployeeRange = value),
              ),
              const SizedBox(height: 24),
              _Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ALU Launchpad',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        Center(
          child: Text(
            'Create Account',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Text(
            'Join ALU Launchpad to connect talent with opportunity.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
      ],
    );
  }
}

class _RoleToggle extends StatelessWidget {
  final bool isStudent;
  final VoidCallback onStudentTap;
  final VoidCallback onStartupTap;

  const _RoleToggle({
    required this.isStudent,
    required this.onStudentTap,
    required this.onStartupTap,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('I am a...', style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: primary),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: onStudentTap,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: isStudent ? primary : Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(7),
                        bottomLeft: Radius.circular(7),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Student',
                        style:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color:
                                      isStudent ? Colors.white : primary,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: onStartupTap,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: isStudent ? Colors.white : primary,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(7),
                        bottomRight: Radius.circular(7),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Startup',
                        style:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color:
                                      isStudent ? primary : Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AccountForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final bool isStudent;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool obscurePassword;
  final VoidCallback onTogglePassword;
  final TextEditingController fullNameController;
  final TextEditingController startupNameController;
  final TextEditingController industryController;
  final TextEditingController locationController;
  final TextEditingController descriptionController;
  final String? selectedEmployeeRange;
  final List<String> employeeRanges;
  final ValueChanged<String?> onEmployeeRangeChanged;

  const _AccountForm({
    required this.formKey,
    required this.isStudent,
    required this.emailController,
    required this.passwordController,
    required this.obscurePassword,
    required this.onTogglePassword,
    required this.fullNameController,
    required this.startupNameController,
    required this.industryController,
    required this.locationController,
    required this.descriptionController,
    required this.selectedEmployeeRange,
    required this.employeeRanges,
    required this.onEmployeeRangeChanged,
  });

  Future<void> _handleSignUp(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    final auth = context.read<AuthProvider>();

    final extraData = isStudent
        ? {'name': fullNameController.text.trim()}
        : {
            'name': startupNameController.text.trim(),
            'industry': industryController.text.trim(),
            'location': locationController.text.trim(),
            'description': descriptionController.text.trim(),
            'employees': selectedEmployeeRange ?? '',
          };

    final success = await auth.signUp(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      role: isStudent ? 'student' : 'startup',
      extraData: extraData,
    );

    if (!context.mounted) return;

    if (success) {
      final uid = auth.currentUser!.uid;
      final role = auth.role;

      if (role == 'startup') {
        context
            .read<OpportunityProvider>()
            .listenToStartupOpportunities(uid);
        context.go('/startup/dashboard');
      } else {
        context.read<OpportunityProvider>().listenToOpportunities();
        context.go('/student/discover');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text(auth.errorMessage ?? 'Sign up failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // shared fields
          _FieldLabel(label: 'Email Address'),
          const SizedBox(height: 6),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'jane@example.com',
              prefixIcon: Icon(Icons.email_outlined),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Email is required';
              }
              if (!value.contains('@')) return 'Enter a valid email';
              return null;
            },
          ),
          const SizedBox(height: 16),
          _FieldLabel(label: 'Password'),
          const SizedBox(height: 6),
          TextFormField(
            controller: passwordController,
            obscureText: obscurePassword,
            decoration: InputDecoration(
              hintText: '••••••••',
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: GestureDetector(
                onTap: onTogglePassword,
                child: Icon(
                  obscurePassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
              ),
              border: const OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Password is required';
              }
              if (value.length < 6) return 'Minimum 6 characters';
              return null;
            },
          ),
          const SizedBox(height: 16),

          // student-specific fields
          if (isStudent) ...[
            _FieldLabel(label: 'Full Name'),
            const SizedBox(height: 6),
            TextFormField(
              controller: fullNameController,
              decoration: const InputDecoration(
                hintText: 'Jane Doe',
                prefixIcon: Icon(Icons.person_outline),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Name is required';
                }
                return null;
              },
            ),
          ],

          // startup-specific fields
          if (!isStudent) ...[
            _FieldLabel(label: 'Startup Name'),
            const SizedBox(height: 6),
            TextFormField(
              controller: startupNameController,
              decoration: const InputDecoration(
                hintText: 'e.g. TechNova Solutions',
                prefixIcon: Icon(Icons.business_outlined),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Startup name is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            _FieldLabel(label: 'Industry'),
            const SizedBox(height: 6),
            TextFormField(
              controller: industryController,
              decoration: const InputDecoration(
                hintText: 'e.g. SaaS, Fintech, EdTech',
                prefixIcon: Icon(Icons.category_outlined),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Industry is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            _FieldLabel(label: 'Location'),
            const SizedBox(height: 6),
            TextFormField(
              controller: locationController,
              decoration: const InputDecoration(
                hintText: 'e.g. Kigali, Rwanda',
                prefixIcon: Icon(Icons.location_on_outlined),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Location is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            _FieldLabel(label: 'Number of Employees'),
            const SizedBox(height: 6),
            DropdownButtonFormField<String>(
              value: selectedEmployeeRange,
              hint: const Text('Select range'),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              items: employeeRanges
                  .map((range) => DropdownMenuItem(
                        value: range,
                        child: Text(range),
                      ))
                  .toList(),
              onChanged: onEmployeeRangeChanged,
              validator: (value) {
                if (value == null) return 'Please select employee range';
                return null;
              },
            ),
            const SizedBox(height: 16),
            _FieldLabel(label: 'About Your Startup'),
            const SizedBox(height: 6),
            TextFormField(
              controller: descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText:
                    'Tell students about your startup, mission and what you do...',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Description is required';
                }
                return null;
              },
            ),
          ],

          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed:
                  auth.isLoading ? null : () => _handleSignUp(context),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: auth.isLoading
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : const Text(
                      'Create Account',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
            ),
          ),
          if (auth.errorMessage != null) ...[
            const SizedBox(height: 12),
            Text(
              auth.errorMessage!,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontSize: 13,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String label;
  const _FieldLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
    );
  }
}

class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          text: 'Already have an account? ',
          style: Theme.of(context).textTheme.bodyMedium,
          children: [
            WidgetSpan(
              child: GestureDetector(
                onTap: () => context.go('/login'),
                child: Text(
                  'Log In',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}