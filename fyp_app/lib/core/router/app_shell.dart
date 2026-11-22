import 'package:flutter/material.dart';
import 'package:fyp_app/shared/widgets/glass_nav_bar.dart';
import 'package:go_router/go_router.dart';

/// Hosts the five tabs (Chats, Calls, Signs, Translate, Me) with the floating glass nav bar.
class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  static const List<GlassNavItem> _items = <GlassNavItem>[
    GlassNavItem(icon: Icon(Icons.chat_bubble_outline_rounded), label: 'Chats'),
    GlassNavItem(icon: Icon(Icons.videocam_outlined), label: 'Calls'),
    GlassNavItem(icon: Icon(Icons.back_hand_outlined), label: 'Signs'),
    GlassNavItem(icon: Icon(Icons.view_in_ar_outlined), label: 'Translate'),
    GlassNavItem(icon: Icon(Icons.person_outline_rounded), label: 'Me'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(child: navigationShell),
          Align(
            alignment: Alignment.bottomCenter,
            child: GlassNavBar(
              items: _items,
              currentIndex: navigationShell.currentIndex,
              onTap: (int index) => navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              ),
            ),
          ),
        ],
      ),
    );
  }
}