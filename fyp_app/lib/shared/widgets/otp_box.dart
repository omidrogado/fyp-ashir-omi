import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

/// Single digit input box for OTP verification screen.
class OtpBox extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final bool autoFocus;

  const OtpBox({
    super.key,
    required this.controller,
    this.focusNode,
    this.onChanged,
    this.autoFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      width: 48,
      height: 56,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: controller.text.isNotEmpty ? colors.accent : colors.sep,
          width: controller.text.isNotEmpty ? 1.5 : 0.5,
        ),
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: TextStyle(
          color: colors.text,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        decoration: const InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
