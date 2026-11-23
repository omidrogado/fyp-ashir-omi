import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/router/app_router.dart';
import '../../../../shared/widgets/glass_button.dart';

class AvatarSelectionScreen extends StatefulWidget {
  const AvatarSelectionScreen({super.key});

  @override
  State<AvatarSelectionScreen> createState() => _AvatarSelectionScreenState();
}

class _AvatarSelectionScreenState extends State<AvatarSelectionScreen> {
  int _selectedIndex = 0;

  // Placeholder avatar configurations until .glb assets are added
  static const List<Map<String, dynamic>> _avatars = [
    {'name': 'Lafzi', 'icon': Icons.face_rounded, 'color': Color(0xFF5AA9FF)},
    {'name': 'Raza', 'icon': Icons.face_3_rounded, 'color': Color(0xFF32D74B)},
    {'name': 'Zara', 'icon': Icons.face_2_rounded, 'color': Color(0xFFFF9C7A)},
    {'name': 'Bilal', 'icon': Icons.face_4_rounded, 'color': Color(0xFFF7D37E)},
  ];

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

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
                'Pick Your Avatar',
                style: TextStyle(
                  color: colors.text,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Your avatar will animate your signs in calls and translations.',
                style: TextStyle(color: colors.sec, fontSize: 15),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: _avatars.length,
                  itemBuilder: (context, index) {
                    final avatar = _avatars[index];
                    final isSelected = _selectedIndex == index;
                    return InkWell(
                      onTap: () => setState(() => _selectedIndex = index),
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        decoration: BoxDecoration(
                          color: colors.card,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isSelected ? colors.accent : colors.sep,
                            width: isSelected ? 2 : 0.5,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 72,
                              height: 72,
                              decoration: BoxDecoration(
                                color: (avatar['color'] as Color).withOpacity(0.15),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                avatar['icon'] as IconData,
                                size: 42,
                                color: avatar['color'] as Color,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              avatar['name'] as String,
                              style: TextStyle(
                                color: colors.text,
                                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: GlassButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.permissions);
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
