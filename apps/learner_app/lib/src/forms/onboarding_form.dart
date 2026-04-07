import 'package:flutter/material.dart';

class OnboardingForm extends StatefulWidget {
  const OnboardingForm({super.key});

  @override
  State<OnboardingForm> createState() => _OnboardingFormState();
}

class _OnboardingFormState extends State<OnboardingForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'display name',
              hintText: 'enter your name',
            ),
            validator: (String? value) {
              if (value == null || value.trim().isEmpty) {
                return 'name is required';
              }
              if (value.trim().length < 2) {
                return 'name must be at least 2 chars';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          FilledButton.tonal(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('onboarding saved locally')),
                );
              }
            },
            child: const Text('save onboarding'),
          ),
        ],
      ),
    );
  }
}
