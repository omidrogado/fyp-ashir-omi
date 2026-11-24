import 'package:flutter/material.dart';
import '../../../core/constants/app_routes.dart';
import '../widgets/listening_indicator.dart';
import '../widgets/sound_type_tile.dart';

class SoundAlertsScreen extends StatelessWidget {
  const SoundAlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const isListening = true;

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
        children: const [
          ListeningIndicator(isListening: isListening),
          SizedBox(height: 24),
          Text('Active Danger Sound Types', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          SoundTypeTile(title: 'Siren (Fire / Police)', isEnabled: true),
          SoundTypeTile(title: 'Smoke / Carbon Monoxide Alarm', isEnabled: true),
          SoundTypeTile(title: 'Car Horn / Honk', isEnabled: true),
          SoundTypeTile(title: 'Glass Break', isEnabled: false),
        ],
      ),
    );
  }
}
