import 'package:flutter/material.dart';
import 'package:fyp_app/core/theme/app_theme.dart';
import 'package:fyp_app/core/theme/app_typography.dart';

/// Message bubble (Design.md sections 5 and 8). Pass either [text] or a custom [child]
/// (voice bubble, sign chips, etc.).
class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    this.text,
    this.child,
    required this.isOutgoing,
  }) : assert((text == null) != (child == null), 'Provide exactly one of text or child');

  final String? text;
  final Widget? child;
  final bool isOutgoing;

  static const double maxBubbleWidth = 272;
  static const Radius _round = Radius.circular(20);
  static const Radius _tail = Radius.circular(6);

  @override
  Widget build(BuildContext context) {
    final AppColors c = context.colors;
    final Color textColor = isOutgoing ? c.onAccent : c.text;

    final BorderRadius radius = BorderRadius.only(
      topLeft: _round,
      topRight: _round,
      bottomLeft: isOutgoing ? _round : _tail,
      bottomRight: isOutgoing ? _tail : _round,
    );

    final Widget content = child ?? Text(text!);

    return Align(
      alignment: isOutgoing ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: maxBubbleWidth),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: radius,
            color: isOutgoing ? null : c.bubbleIn,
            gradient: isOutgoing
                ? LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[c.outA, c.outB],
                  )
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
            child: DefaultTextStyle.merge(
              style: AppTypography.body.copyWith(height: 1.3, color: textColor),
              child: content,
            ),
          ),
        ),
      ),
    );
  }
}