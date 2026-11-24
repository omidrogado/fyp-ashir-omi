import 'package:flutter/material.dart';

class AmbiguousSignPopup extends StatelessWidget {
  final List<String> candidates;
  final ValueChanged<String> onSelected;

  const AmbiguousSignPopup({super.key, required this.candidates, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: candidates.map((c) => ListTile(title: Text(c), onTap: () => onSelected(c))).toList(),
      ),
    );
  }
}
