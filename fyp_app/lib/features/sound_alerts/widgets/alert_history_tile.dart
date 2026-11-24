import 'package:flutter/material.dart';
import '../../../data/models/danger_alert.dart';
import '../../../core/utils/date_formatter.dart';

class AlertHistoryTile extends StatelessWidget {
  final DangerAlert alert;
  const AlertHistoryTile({super.key, required this.alert});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.warning_amber_rounded, color: Colors.red),
      title: Text(alert.soundType.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('${(alert.confidence * 100).toStringAsFixed(0)}% confidence'),
      trailing: Text(DateFormatter.formatTimestamp(alert.timestamp)),
    );
  }
}
