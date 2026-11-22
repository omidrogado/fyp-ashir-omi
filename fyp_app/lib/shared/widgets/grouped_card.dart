import 'package:flutter/material.dart';
import 'package:fyp_app/core/theme/app_theme.dart';
import 'package:fyp_app/core/theme/app_typography.dart';
import 'package:fyp_app/shared/widgets/glass_surface.dart';

/// 30x30 rounded icon tile used in settings and onboarding rows.
/// Pass a tile colour token such as `context.colors.tileEar`.
class IconTile extends StatelessWidget {
  const IconTile({
    super.key,
    required this.icon,
    required this.color,
    this.size = 30,
    this.radius = 8,
  });

  final Widget icon;
  final Color color;
  final double size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(radius)),
      child: IconTheme(
        data: IconThemeData(color: context.colors.onAccent, size: size * 0.6),
        child: Center(child: icon),
      ),
    );
  }
}

@immutable
class GroupedCardItem {
  const GroupedCardItem({
    required this.title,
    this.leading,
    this.trailingText,
    this.showChevron = true,
    this.onTap,
  });

  final String title;
  final Widget? leading;
  final String? trailingText;
  final bool showChevron;
  final VoidCallback? onTap;
}

/// Grouped settings card (radius 20, 54 px rows, 0.5 px separators).
/// Use the default constructor for rows, or [GroupedCard.custom] for free content
/// such as the onboarding role cards.
class GroupedCard extends StatelessWidget {
  const GroupedCard({
    super.key,
    required List<GroupedCardItem> this.items,
    this.glass = false,
  })  : child = null,
        padding = EdgeInsets.zero,
        selected = false;

  const GroupedCard.custom({
    super.key,
    required Widget this.child,
    this.padding = const EdgeInsets.all(16),
    this.glass = false,
    this.selected = false,
  }) : items = null;

  final List<GroupedCardItem>? items;
  final Widget? child;
  final EdgeInsetsGeometry padding;
  final bool glass;

  /// 2 px accent border + 4 px soft halo (Design.md section 5).
  final bool selected;

  static const double _radius = 20;

  @override
  Widget build(BuildContext context) {
    final AppColors c = context.colors;
    final BorderRadius radius = BorderRadius.circular(_radius);

    final List<GroupedCardItem>? rows = items;
    final Widget content = rows != null
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (int i = 0; i < rows.length; i++)
                _GroupedRow(item: rows[i], showSeparator: i < rows.length - 1),
            ],
          )
        : Padding(padding: padding, child: child);

    final Widget surface = glass
        ? GlassSurface(borderRadius: radius, child: content)
        : DecoratedBox(
            decoration: BoxDecoration(color: c.groupBg, borderRadius: radius),
            child: ClipRRect(borderRadius: radius, child: content),
          );

    if (!selected) return surface;

    return DecoratedBox(
      position: DecorationPosition.foreground,
      decoration: BoxDecoration(
        borderRadius: radius,
        border: Border.all(color: c.accent, width: 2),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: radius,
          boxShadow: <BoxShadow>[BoxShadow(color: c.accentSoft, spreadRadius: 4)],
        ),
        child: surface,
      ),
    );
  }
}

class _GroupedRow extends StatelessWidget {
  const _GroupedRow({required this.item, required this.showSeparator});

  final GroupedCardItem item;
  final bool showSeparator;

  @override
  Widget build(BuildContext context) {
    final AppColors c = context.colors;
    final bool tappable = item.onTap != null;

    return MergeSemantics(
      child: Semantics(
        button: tappable,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: item.onTap,
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 54),
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: <Widget>[
                    if (item.leading != null) ...<Widget>[
                      item.leading!,
                      const SizedBox(width: 12),
                    ],
                    Expanded(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: showSeparator
                              ? Border(bottom: BorderSide(color: c.sep, width: 0.5))
                              : null,
                        ),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(minHeight: 54),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    item.title,
                                    style: AppTypography.body.copyWith(color: c.text),
                                  ),
                                ),
                                if (item.trailingText != null) ...<Widget>[
                                  const SizedBox(width: 8),
                                  Text(
                                    item.trailingText!,
                                    style: AppTypography.body
                                        .copyWith(fontSize: 15, color: c.sec),
                                  ),
                                ],
                                if (item.showChevron) ...<Widget>[
                                  const SizedBox(width: 6),
                                  Icon(Icons.chevron_right_rounded, size: 18, color: c.sec),
                                ],
                              ],
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
        ),
      ),
    );
  }
}