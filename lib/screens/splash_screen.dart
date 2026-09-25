import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../theme/app_theme.dart';
import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;

  const SplashScreen({super.key, required this.onToggleTheme});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          _visible = true;
        });
      }
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => MainScreen(onToggleTheme: widget.onToggleTheme),
        ),
      );
    });
  }

  Widget _glow(double size) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(colors: [Color(0x663B82F6), Color(0x003B82F6)]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(top: -120, right: -100, child: _glow(320)),
          Positioned(bottom: -150, left: -120, child: _glow(360)),
          Center(
            child: AnimatedOpacity(
              opacity: _visible ? 1 : 0,
              duration: const Duration(milliseconds: 800),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'N', style: TextStyle(color: Colors.white)),
                        TextSpan(text: 'F', style: TextStyle(color: AppTheme.blue)),
                      ],
                    ),
                    style: TextStyle(fontSize: 72, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    AppConstants.name,
                    style: TextStyle(
                        fontSize: 28, fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    AppConstants.title,
                    style: TextStyle(fontSize: 16, color: AppTheme.mist),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    AppConstants.tagline,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white54, letterSpacing: 1, height: 1.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
