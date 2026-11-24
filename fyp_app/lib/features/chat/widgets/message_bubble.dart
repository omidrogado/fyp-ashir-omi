import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isOutgoing;

  const MessageBubble({
    super.key,
    required this.text,
    required this.isOutgoing,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isOutgoing
        ? (isDark ? AppColors.darkOutB : AppColors.lightOutB)
        : (isDark ? AppColors.darkBubbleIn : AppColors.lightBubbleIn);
    final textColor = isOutgoing ? Colors.white : (isDark ? AppColors.darkText : AppColors.lightText);

    return Align(
      alignment: isOutgoing ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(text, style: TextStyle(color: textColor, fontSize: 16)),
      ),
    );
  }
}
