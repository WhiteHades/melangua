import 'package:flutter/material.dart';

import '../shared/placeholder_scaffold.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScaffold(
      title: 'Practice',
      description: 'Voice session flow (Mic -> ASR -> Tutor -> TTS) lands here.',
    );
  }
}
