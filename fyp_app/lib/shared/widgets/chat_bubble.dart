import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

/// iOS-styled chat bubble for incoming and outgoing messages.
class ChatBubble extends StatelessWidget {
  final String text;
  final bool isOutgoing;
  final String? time;
  final Widget? trailing;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isOutgoing,
    this.time,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final bubbleDecoration = isOutgoing
        ? BoxDecoration(
            gradient: LinearGradient(
              colors: [colors.outA, colors.outB],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
              bottomLeft: Radius.circular(18),
              bottomRight: Radius.circular(4),
            ),
          )
        : BoxDecoration(
            color: colors.bubbleIn,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
              bottomLeft: Radius.circular(4),
              bottomRight: Radius.circular(18),
            ),
          );

    final textColor = isOutgoing ? colors.onAccent : colors.text;

    return Align(
      alignment: isOutgoing ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.76),
        decoration: bubbleDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            if (time != null || trailing != null) ...[
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (time != null)
                    Text(
                      time!,
                      style: TextStyle(
                        color: isOutgoing ? colors.onAccent.withOpacity(0.7) : colors.sec,
                        fontSize: 11,
                      ),
                    ),
                  if (trailing != null) ...[
                    const SizedBox(width: 4),
                    trailing!,
                  ],
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
