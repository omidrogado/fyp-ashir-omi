import 'package:flutter/material.dart';

class SignRowView extends StatelessWidget {
  final List<String> signTokens;
  const SignRowView({super.key, required this.signTokens});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: signTokens.length,
        itemBuilder: (context, index) {
          return Chip(label: Text(signTokens[index]));
        },
      ),
    );
  }
}
