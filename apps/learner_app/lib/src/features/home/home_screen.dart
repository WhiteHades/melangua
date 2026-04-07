import 'package:flutter/material.dart';

import '../../forms/onboarding_form.dart';
import '../../widgets/accessibility_banner.dart';
import '../shared/placeholder_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AccessibilityBanner(),
            PlaceholderScaffold(
              title: 'Home',
              description:
                  'Today\'s practice summary, streak, and quick start action will live here.',
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: OnboardingForm(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
