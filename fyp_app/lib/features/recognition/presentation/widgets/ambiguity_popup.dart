import 'package:flutter/material.dart';
import '../../../../../core/theme/app_theme.dart';

/// Pop-up shown when the DTW matcher detects ambiguous sign candidates.
/// User taps the correct meaning (never auto-sent).
class AmbiguityPopup extends StatelessWidget {
  final List<String> candidates;
  final ValueChanged<String> onSelected;

  const AmbiguityPopup({
    super.key,
    required this.candidates,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Which sign did you mean?',
            style: TextStyle(
              color: colors.text,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...candidates.map(
            (candidate) => ListTile(
              title: Text(candidate, style: TextStyle(color: colors.text)),
              onTap: () => onSelected(candidate),
              trailing: Icon(Icons.chevron_right, color: colors.sec),
            ),
          ),
        ],
      ),
    );
  }
}
