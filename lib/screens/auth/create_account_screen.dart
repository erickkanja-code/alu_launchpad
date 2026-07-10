import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _isStudent = true;
  bool _obscurePassword = true;

  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
                fullNameController: _fullNameController,
                emailController: _emailController,
                passwordController: _passwordController,
                obscurePassword: _obscurePassword,
                onTogglePassword: () => setState(() => _obscurePassword = !_obscurePassword),
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
        Text(
          'I am a...',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
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
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: isStudent ? Colors.white : primary,
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
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: isStudent ? primary : Colors.white,
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
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool obscurePassword;
  final VoidCallback onTogglePassword;

  const _AccountForm({
    required this.formKey,
    required this.fullNameController,
    required this.emailController,
    required this.passwordController,
    required this.obscurePassword,
    required this.onTogglePassword,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
              if (value == null || value.trim().isEmpty) return 'Name is required';
              return null;
            },
          ),
          const SizedBox(height: 16),
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
              if (value == null || value.trim().isEmpty) return 'Email is required';
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
                  obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                ),
              ),
              border: const OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) return 'Password is required';
              if (value.length < 6) return 'Minimum 6 characters';
              return null;
            },
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.go('/startup/dashboard');
                  // auth logic comes Day 4
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Create Account',
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
                onTap: () {
                  context.push('/');
                },
                child: Text('Log In',
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