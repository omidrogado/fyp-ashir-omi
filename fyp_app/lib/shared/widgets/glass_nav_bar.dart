import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:fyp_app/core/theme/app_theme.dart';
import 'package:fyp_app/core/theme/app_typography.dart';
import 'package:fyp_app/shared/widgets/focus_ring.dart';
import 'package:fyp_app/shared/widgets/glass_surface.dart';

@immutable
class GlassNavItem {
  const GlassNavItem({required this.icon, required this.label});

  final Widget icon;
  final String label;
}

/// Floating glass bottom navigation (Design.md sections 5 and 6).
/// Height 70, radius 35, items 64x56 with radius 28.
class GlassNavBar extends StatelessWidget {
  const GlassNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  }) : assert(items.length >= 2, 'A navigation bar needs at least two items');

  final List<GlassNavItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  static const double barHeight = 70;
  static const double sideMargin = 16;
  static const double bottomMargin = 22;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    final double bottom = math.max(bottomMargin, media.padding.bottom + 8);

    // 10 px tab labels must not break the bar at large system font sizes.
    return MediaQuery(
      data: media.copyWith(textScaler: media.textScaler.clamp(maxScaleFactor: 1.2)),
      child: Padding(
        padding: EdgeInsets.fromLTRB(sideMargin, 0, sideMargin, bottom),
        child: SizedBox(
          height: barHeight,
          child: GlassSurface(
            borderRadius: BorderRadius.circular(barHeight / 2),
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              children: <Widget>[
                for (int i = 0; i < items.length; i++)
                  Expanded(
                    child: Center(
                      child: _NavButton(
                        item: items[i],
                        selected: i == currentIndex,
                        onTap: () => onTap(i),
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

class _NavButton extends StatelessWidget {
  const _NavButton({required this.item, required this.selected, required this.onTap});

  final GlassNavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final AppColors c = context.colors;
    final BorderRadius radius = BorderRadius.circular(28);
    final Color foreground = selected ? c.accent : c.sec;
    final bool reduceMotion = MediaQuery.disableAnimationsOf(context);

    return Semantics(
      button: true,
      selected: selected,
      label: item.label,
      excludeSemantics: true,
      child: FocusRing(
        borderRadius: radius,
        child: AnimatedContainer(
          duration: reduceMotion ? Duration.zero : const Duration(milliseconds: 200),
          width: 64,
          height: 56,
          decoration: BoxDecoration(
            color: selected ? c.navActiveBg : null,
            borderRadius: radius,
          ),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              borderRadius: radius,
              focusColor: Colors.transparent,
              onTap: onTap,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconTheme(
                    data: IconThemeData(color: foreground, size: 22),
                    child: item.icon,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    item.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.tab.copyWith(color: foreground),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}