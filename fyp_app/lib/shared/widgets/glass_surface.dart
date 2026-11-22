import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:fyp_app/core/theme/app_theme.dart';

/// Base glass layer (Design.md section 6). Use only on floating / overlay elements.
class GlassSurface extends StatelessWidget {
  const GlassSurface({
    super.key,
    required this.child,
    required this.borderRadius,
    this.padding = EdgeInsets.zero,
    this.showShadow = true,
  });

  final Widget child;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;
  final bool showShadow;

  /// Design reference uses blur 28. Tune on low-end devices in Phase 6 if needed.
  static const double blurSigma = 28;

  @override
  Widget build(BuildContext context) {
    final AppColors c = context.colors;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: showShadow ? c.glassShadow : const <BoxShadow>[],
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[c.glassStart, c.glassEnd],
              ),
              border: Border.all(color: c.glassBorder, width: c.glassBorderWidth),
            ),
            child: Padding(padding: padding, child: child),
          ),
        ),
      ),
    );
  }
}