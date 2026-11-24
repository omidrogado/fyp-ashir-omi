import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/alert_history_provider.dart';
import '../widgets/alert_history_tile.dart';

class AlertHistoryScreen extends ConsumerWidget {
  const AlertHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alerts = ref.watch(alertHistoryListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Alert History')),
      body: alerts.isEmpty
          ? const Center(child: Text('No danger sounds detected recently.'))
          : ListView.builder(
              itemCount: alerts.length,
              itemBuilder: (context, index) {
                return AlertHistoryTile(alert: alerts[index]);
              },
            ),
    );
  }
}
