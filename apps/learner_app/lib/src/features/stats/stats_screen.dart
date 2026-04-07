import 'package:flutter/material.dart';

import '../shared/placeholder_scaffold.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScaffold(
      title: 'Stats',
      description:
          'Kpis, 7/30/90 trends, and learning/system metrics will be displayed here.',
    );
  }
}
