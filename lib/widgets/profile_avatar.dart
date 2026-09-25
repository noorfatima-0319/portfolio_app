import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class ProfileAvatar extends StatelessWidget {
  final double radius;

  const ProfileAvatar({super.key, this.radius = 45});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: colors.primary),
      ),
      child: ClipOval(
        child: SizedBox(
          width: radius * 2,
          height: radius * 2,
          child: Image.asset(
            'assets/images/profile.png',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color: colors.primary,
              alignment: Alignment.center,
              child: Text(
                AppConstants.initials,
                style: TextStyle(
                  fontSize: radius * 0.7,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
