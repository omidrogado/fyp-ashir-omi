import 'package:flutter/material.dart';

class HandOverlayPainter extends CustomPainter {
  final List<Offset> landmarks;
  HandOverlayPainter({required this.landmarks});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.greenAccent
      ..strokeWidth = 3;
    for (final point in landmarks) {
      canvas.drawCircle(point, 4, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
