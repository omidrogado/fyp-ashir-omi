import 'package:flutter/material.dart';
import 'package:fyp_app/core/theme/app_theme.dart';

/// Design.md section 11: visible 3 px accent outline on keyboard / switch focus.
/// Not shown for touch focus, so taps stay clean.
class FocusRing extends StatefulWidget {
  const FocusRing({super.key, required this.child, required this.borderRadius});

  final Widget child;
  final BorderRadius borderRadius;

  @override
  State<FocusRing> createState() => _FocusRingState();
}

class _FocusRingState extends State<FocusRing> {
  bool _visible = false;

  void _onFocusChange(bool hasFocus) {
    final bool traditional =
        FocusManager.instance.highlightMode == FocusHighlightMode.traditional;
    final bool next = hasFocus && traditional;
    if (next != _visible) setState(() => _visible = next);
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      onFocusChange: _onFocusChange,
      child: DecoratedBox(
        position: DecorationPosition.foreground,
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius,
          border: _visible ? Border.all(color: context.colors.accent, width: 3) : null,
        ),
        child: widget.child,
      ),
    );
  }
}