import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final bool filled;
  final bool iconAtEnd;

  const CustomButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    this.filled = true,
    this.iconAtEnd = false,
  });

  @override
  Widget build(BuildContext context) {
    final label = Text(title, style: const TextStyle(fontWeight: FontWeight.w600));
    final iconWidget = Icon(icon, size: 18);
    final content = Row(
      mainAxisSize: MainAxisSize.min,
      children: iconAtEnd
          ? [label, const SizedBox(width: 8), iconWidget]
          : [iconWidget, const SizedBox(width: 8), label],
    );
    final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(14));

    if (filled) {
      return FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(minimumSize: const Size(0, 50), shape: shape),
        child: content,
      );
    }
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(0, 50),
        shape: shape,
        side: BorderSide(color: Theme.of(context).colorScheme.primary),
      ),
      child: content,
    );
  }
}
