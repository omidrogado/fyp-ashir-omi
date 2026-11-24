import 'package:flutter/material.dart';

class ListeningIndicator extends StatelessWidget {
  final bool isListening;
  const ListeningIndicator({super.key, required this.isListening});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isListening ? Colors.green.withValues(alpha: 0.12) : Colors.grey.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(
            isListening ? Icons.hearing_rounded : Icons.hearing_disabled_rounded,
            color: isListening ? Colors.green : Colors.grey,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isListening ? 'Background Listening Active' : 'Listening Inactive',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  isListening ? 'Monitoring for emergency sirens and alarms' : 'Tap settings to turn on',
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
