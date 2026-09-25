import 'package:flutter/material.dart';

import 'about_screen.dart';
import 'contact_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;

  const MainScreen({super.key, required this.onToggleTheme});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;

  void _goTo(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final pages = [
      HomeScreen(onToggleTheme: widget.onToggleTheme, onGoToTab: _goTo),
      AboutScreen(onBack: () => _goTo(0)),
      ContactScreen(onBack: () => _goTo(0)),
    ];

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: IndexedStack(index: _index, children: pages),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: _goTo,
        type: BottomNavigationBarType.fixed,
        backgroundColor: colors.surface,
        selectedItemColor: colors.primary,
        unselectedItemColor: colors.onSurfaceVariant,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.mail_outline), label: 'Contact'),
        ],
      ),
    );
  }
}
