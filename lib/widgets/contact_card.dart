import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'info_card.dart';

class ContactCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const ContactCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.color = const Color(0xFF3B82F6),
  });

  void _copyValue(BuildContext context) {
    Clipboard.setData(ClipboardData(text: value));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$label copied')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InfoCard(
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
          leading: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white),
          ),
          title: Text(label, style: const TextStyle(fontSize: 13)),
          subtitle: Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
          trailing: const Icon(Icons.copy_rounded, size: 18),
          onTap: () => _copyValue(context),
        ),
      ),
    );
  }
}
