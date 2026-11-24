import 'package:flutter/material.dart';

class SoundTypeTile extends StatelessWidget {
  final String title;
  final bool isEnabled;

  const SoundTypeTile({super.key, required this.title, required this.isEnabled});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: isEnabled,
      onChanged: (v) {},
      title: Text(title, style: const TextStyle(fontSize: 15)),
    );
  }
}
