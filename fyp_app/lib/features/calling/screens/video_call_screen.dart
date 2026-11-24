import 'package:flutter/material.dart';
import '../widgets/call_controls.dart';
import '../widgets/live_caption_bar.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: const [
          Center(child: Text('WebRTC Stream / Skeleton Avatar', style: TextStyle(color: Colors.white))),
          Positioned(top: 60, left: 16, right: 16, child: LiveCaptionBar()),
          Positioned(bottom: 30, left: 0, right: 0, child: CallControls()),
        ],
      ),
    );
  }
}
