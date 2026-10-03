import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../constants/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

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
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    });
  }

  Widget _glow(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color.withValues(alpha: 0.4), color.withValues(alpha: 0)],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      // Background comes from the theme, so it follows light/dark mode
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(top: -120, right: -100, child: _glow(320, colors.primary)),
          Positioned(bottom: -150, left: -120, child: _glow(360, colors.primary)),
          Center(
            child: AnimatedOpacity(
              opacity: _visible ? 1 : 0,
              duration: const Duration(milliseconds: 800),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(text: 'N'),
                        TextSpan(text: 'F', style: TextStyle(color: colors.primary)),
                      ],
                    ),
                    style: TextStyle(
                      fontSize: 72,
                      fontWeight: FontWeight.w800,
                      color: colors.onSurface,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    AppConstants.name,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: colors.onSurface,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    AppConstants.title,
                    style: TextStyle(fontSize: 16, color: colors.onSurfaceVariant),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    AppConstants.tagline,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: colors.onSurface.withValues(alpha: 0.6),
                      letterSpacing: 1,
                      height: 1.5,
                    ),
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
