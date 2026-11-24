import 'package:flutter/material.dart';
import '../../../core/constants/app_routes.dart';
import '../../../core/widgets/primary_button.dart';

class IntroSlidesScreen extends StatelessWidget {
  const IntroSlidesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Text('How Lafzio Works', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              const Text('1. Sign-to-Text Recognition on camera.\n2. Speech-to-Sign 3D Avatar Translation.\n3. Background YAMNet Danger Sound Alerts.', textAlign: TextAlign.center),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  onPressed: () => Navigator.pushNamed(context, AppRoutes.roleSelection),
                  child: const Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
