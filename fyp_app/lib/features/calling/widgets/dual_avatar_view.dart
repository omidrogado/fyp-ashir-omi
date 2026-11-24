import 'package:flutter/material.dart';

class DualAvatarView extends StatelessWidget {
  const DualAvatarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Center(child: Text('Local Avatar', style: TextStyle(color: Colors.white)))),
        Expanded(child: Center(child: Text('Peer Avatar', style: TextStyle(color: Colors.white)))),
      ],
    );
  }
}
