import 'package:flutter/material.dart';

class TakeCounter extends StatelessWidget {
  final int currentTake;
  const TakeCounter({super.key, required this.currentTake});

  @override
  Widget build(BuildContext context) {
    return Text('Take $currentTake of 3', style: const TextStyle(fontWeight: FontWeight.bold));
  }
}
