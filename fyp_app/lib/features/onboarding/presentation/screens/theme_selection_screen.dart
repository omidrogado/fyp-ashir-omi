import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/router/app_router.dart';
import '../../../../shared/widgets/glass_button.dart';

class ThemeSelectionScreen extends StatefulWidget {
  const ThemeSelectionScreen({super.key});

  @override
  State<ThemeSelectionScreen> createState() => _ThemeSelectionScreenState();
}

class _ThemeSelectionScreenState extends State<ThemeSelectionScreen> {
  String _selectedTheme = 'system';

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final options = [
      {'id': 'system', 'title': 'System Default', 'icon': Icons.brightness_auto},
      {'id': 'light', 'title': 'Light Mode', 'icon': Icons.light_mode},
      {'id': 'dark', 'title': 'Dark Mode', 'icon': Icons.dark_mode},
    ];

    return Scaffold(
      backgroundColor: colors.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: colors.text),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                'Choose Appearance',
                style: TextStyle(
                  color: colors.text,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Select your preferred theme. You can change this anytime.',
                style: TextStyle(
                  color: colors.sec,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 32),
              ...options.map((opt) {
                final isSelected = _selectedTheme == opt['id'];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: InkWell(
                    onTap: () => setState(() => _selectedTheme = opt['id'] as String),
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: colors.card,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: isSelected ? colors.accent : colors.sep,
                          width: isSelected ? 2 : 0.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(opt['icon'] as IconData, color: isSelected ? colors.accent : colors.sec),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              opt['title'] as String,
                              style: TextStyle(
                                color: colors.text,
                                fontSize: 16,
                                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                              ),
                            ),
                          ),
                          if (isSelected)
                            Icon(Icons.check_circle_rounded, color: colors.accent),
                        ],
                      ),
                    ),
                  ),
                );
              }),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: GlassButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.userType);
                  },
                  child: const Text('Continue'),
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
