import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/router/app_router.dart';
import '../../../../shared/widgets/glass_button.dart';

class UserTypeScreen extends StatefulWidget {
  const UserTypeScreen({super.key});

  @override
  State<UserTypeScreen> createState() => _UserTypeScreenState();
}

class _UserTypeScreenState extends State<UserTypeScreen> {
  String _selectedType = 'deaf';

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final types = [
      {
        'id': 'deaf',
        'title': 'Deaf / Hard of Hearing',
        'description': 'Communicate using sign language recognition, haptic danger alerts, and avatars.',
        'icon': Icons.hearing_disabled_rounded,
      },
      {
        'id': 'hearing',
        'title': 'Hearing User',
        'description': 'Communicate using voice, speech-to-sign translations, and text.',
        'icon': Icons.hearing_rounded,
      },
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
                'How will you use Lafzio?',
                style: TextStyle(
                  color: colors.text,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'This tailors your input tools and accessibility defaults.',
                style: TextStyle(
                  color: colors.sec,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 32),
              ...types.map((t) {
                final isSelected = _selectedType == t['id'];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: InkWell(
                    onTap: () => setState(() => _selectedType = t['id'] as String),
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: colors.card,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected ? colors.accent : colors.sep,
                          width: isSelected ? 2 : 0.5,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(t['icon'] as IconData, color: isSelected ? colors.accent : colors.sec, size: 28),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  t['title'] as String,
                                  style: TextStyle(
                                    color: colors.text,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              if (isSelected)
                                Icon(Icons.check_circle_rounded, color: colors.accent),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            t['description'] as String,
                            style: TextStyle(color: colors.sec, fontSize: 13, height: 1.3),
                          ),
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
                    Navigator.of(context).pushNamed(AppRoutes.profileSetup);
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
