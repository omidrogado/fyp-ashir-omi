import 'package:flutter/material.dart';
import '../../../../../core/theme/app_theme.dart';

/// On-screen keyboard that shows mapped sign images for each letter/token.
class SignKeyboardWidget extends StatelessWidget {
  final ValueChanged<String> onTokenSelected;

  const SignKeyboardWidget({super.key, required this.onTokenSelected});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      color: colors.raised,
      padding: const EdgeInsets.all(8),
      child: const Center(
        child: Text('Sign keyboard mapping will appear here.'),
      ),
    );
  }
}
