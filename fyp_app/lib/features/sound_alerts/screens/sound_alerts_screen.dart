import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_routes.dart';
import '../providers/sound_alerts_provider.dart';
import '../widgets/listening_indicator.dart';
import '../widgets/sound_type_tile.dart';

class SoundAlertsScreen extends ConsumerWidget {
  const SoundAlertsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isListening = ref.watch(isListeningProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sound Alerts', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.history_rounded),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.alertHistory),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListeningIndicator(isListening: isListening),
          const SizedBox(height: 24),
          const Text('Active Danger Sound Types', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const SoundTypeTile(title: 'Siren (Fire / Police)', isEnabled: true),
          const SoundTypeTile(title: 'Smoke / Carbon Monoxide Alarm', isEnabled: true),
          const SoundTypeTile(title: 'Car Horn / Honk', isEnabled: true),
          const SoundTypeTile(title: 'Glass Break', isEnabled: false),
        ],
      ),
    );
  }
}
