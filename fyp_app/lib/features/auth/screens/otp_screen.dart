import 'package:flutter/material.dart';
import '../../../core/constants/app_routes.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/widgets/app_text_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48),
              const Text('Verification Code', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              AppTextField(controller: otpController, hintText: '6-digit OTP', keyboardType: TextInputType.number),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.chats),
                  child: const Text('Verify & Enter'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
