import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/router/app_router.dart';
import '../../../../shared/widgets/grouped_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      backgroundColor: colors.bgGrouped,
      appBar: AppBar(
        title: Text('Settings', style: TextStyle(color: colors.text, fontWeight: FontWeight.bold)),
        backgroundColor: colors.bgGrouped,
        elevation: 0,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          GroupedCard(
            children: [
              _SettingsRow(icon: Icons.person_outline, title: 'Edit Profile', colors: colors,
                  onTap: () => Navigator.of(context).pushNamed(AppRoutes.editProfile)),
              Divider(height: 1, color: colors.sep, indent: 56),
              _SettingsRow(icon: Icons.face_rounded, title: 'Change Avatar', colors: colors,
                  onTap: () => Navigator.of(context).pushNamed(AppRoutes.changeAvatar)),
            ],
          ),
          GroupedCard(
            children: [
              _SettingsRow(icon: Icons.language, title: 'Language & Speech', colors: colors,
                  onTap: () => Navigator.of(context).pushNamed(AppRoutes.languageSpeechSettings)),
              Divider(height: 1, color: colors.sep, indent: 56),
              _SettingsRow(icon: Icons.hearing_disabled_rounded, title: 'Danger Detection', colors: colors,
                  onTap: () => Navigator.of(context).pushNamed(AppRoutes.dangerDetectionSettings)),
            ],
          ),
          GroupedCard(
            children: [
              _SettingsRow(icon: Icons.help_outline, title: 'Help Center', colors: colors,
                  onTap: () => Navigator.of(context).pushNamed(AppRoutes.helpCenter)),
            ],
          ),
        ],
      ),
    );
  }
}

class _SettingsRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final AppColors colors;

  const _SettingsRow({
    required this.icon,
    required this.title,
    required this.onTap,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: colors.accentSoft,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: colors.accent, size: 18),
      ),
      title: Text(title, style: TextStyle(color: colors.text, fontSize: 16)),
      trailing: Icon(Icons.chevron_right, color: colors.sec),
      onTap: onTap,
    );
  }
}
