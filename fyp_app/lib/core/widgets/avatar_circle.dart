import 'package:flutter/material.dart';

class AvatarCircle extends StatelessWidget {
  final String name;
  final double radius;
  final String? imageUrl;

  const AvatarCircle({
    super.key,
    required this.name,
    this.radius = 24,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final initial = name.isNotEmpty ? name[0].toUpperCase() : '?';

    return CircleAvatar(
      radius: radius,
      backgroundColor: const Color(0xFF5AA9FF).withValues(alpha: 0.2),
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
      child: imageUrl == null
          ? Text(
              initial,
              style: TextStyle(
                fontSize: radius * 0.8,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF0A6CF5),
              ),
            )
          : null,
    );
  }
}
