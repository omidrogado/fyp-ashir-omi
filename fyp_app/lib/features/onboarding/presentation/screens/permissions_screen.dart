import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/router/app_router.dart';
import '../../../../shared/widgets/glass_button.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final permissions = [
      {
        'title': 'Camera',
        'description': 'For sign recognition and video calls',
        'icon': Icons.camera_alt_outlined,
      },
      {
        'title': 'Microphone',
        'description': 'For voice messages and speech-to-sign',
        'icon': Icons.mic_outlined,
      },
      {
        'title': 'Notifications',
        'description': 'For incoming calls, messages, and danger alerts',
        'icon': Icons.notifications_outlined,
      },
    ];

    return Scaffold(
      backgroundColor: colors.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text(
                'Allow Access',
                style: TextStyle(
                  color: colors.text,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Lafzio needs these permissions to work.',
                style: TextStyle(color: colors.sec, fontSize: 15),
              ),
              const SizedBox(height: 32),
              ...permissions.map((p) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: colors.card,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: colors.accentSoft,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(p['icon'] as IconData, color: colors.accent),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              p['title'] as String,
                              style: TextStyle(
                                color: colors.text,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              p['description'] as String,
                              style: TextStyle(color: colors.sec, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: GlassButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(AppRoutes.chatList);
                  },
                  child: const Text('Allow & Continue'),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
