import 'package:flutter/material.dart';
import 'package:fyp_app/core/theme/app_theme.dart';
import 'package:fyp_app/shared/widgets/focus_ring.dart';
import 'package:fyp_app/shared/widgets/glass_surface.dart';

enum GlassButtonStyle { glass, accent, danger }

/// Round icon button. Default is the 44x44 glass button; `accent` is the filled
/// "send a sign" style and `danger` is the red "End call" style.
class GlassButton extends StatelessWidget {
  const GlassButton({
    super.key,
    required this.icon,
    required this.semanticLabel,
    required this.onPressed,
    this.size = 44,
    this.iconSize = 22,
    this.style = GlassButtonStyle.glass,
  }) : assert(size >= 44, 'Touch targets must be at least 44x44');

  final Widget icon;

  /// Required: icon-only buttons need a screen-reader label (Design.md section 11).
  final String semanticLabel;
  final VoidCallback? onPressed;
  final double size;
  final double iconSize;
  final GlassButtonStyle style;

  @override
  Widget build(BuildContext context) {
    final AppColors c = context.colors;
    final BorderRadius radius = BorderRadius.circular(size / 2);

    final Color foreground = switch (style) {
      GlassButtonStyle.glass => c.text,
      GlassButtonStyle.accent => c.onAccent,
      GlassButtonStyle.danger => c.onDanger,
    };

    final Widget background = switch (style) {
      GlassButtonStyle.glass => GlassSurface(borderRadius: radius, child: const SizedBox.expand()),
      GlassButtonStyle.accent => DecoratedBox(
          decoration: BoxDecoration(color: c.accent, borderRadius: radius),
        ),
      GlassButtonStyle.danger => DecoratedBox(
          decoration: BoxDecoration(color: c.danger, borderRadius: radius),
        ),
    };

    return Semantics(
      button: true,
      enabled: onPressed != null,
      label: semanticLabel,
      excludeSemantics: true,
      child: Opacity(
        opacity: onPressed == null ? 0.4 : 1,
        child: FocusRing(
          borderRadius: radius,
          child: SizedBox.square(
            dimension: size,
            child: Stack(
              children: <Widget>[
                Positioned.fill(child: background),
                Positioned.fill(
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      focusColor: Colors.transparent,
                      onTap: onPressed,
                      child: Center(
                        child: IconTheme(
                          data: IconThemeData(color: foreground, size: iconSize),
                          child: icon,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}