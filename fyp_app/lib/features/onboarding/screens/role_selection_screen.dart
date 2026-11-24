import 'package:flutter/material.dart';
import '../../../core/constants/app_routes.dart';
import '../../../core/widgets/primary_button.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  String selectedRole = 'deaf';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              const Text('Choose Your Role', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Select how you will communicate on Lafzio.', style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 32),
              ListTile(
                title: const Text('Deaf / Hard of Hearing'),
                leading: Radio<String>(
                  value: 'deaf',
                  groupValue: selectedRole,
                  onChanged: (v) => setState(() => selectedRole = v!),
                ),
              ),
              ListTile(
                title: const Text('Hearing Individual'),
                leading: Radio<String>(
                  value: 'hearing',
                  groupValue: selectedRole,
                  onChanged: (v) => setState(() => selectedRole = v!),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  onPressed: () => Navigator.pushNamed(context, AppRoutes.permissions),
                  child: const Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
