import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../widgets/contact_card.dart';
import '../widgets/section_title.dart';

class ContactScreen extends StatefulWidget {
  final VoidCallback onBack;

  const ContactScreen({super.key, required this.onBack});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  String? _required(String? value) {
    if (value == null || value.trim().isEmpty) return 'This field is required';
    return null;
  }

  void _sendMessage() {
    if (!_formKey.currentState!.validate()) return;

    // this is a UI demo, so nothing is sent anywhere
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("'It's just a demo form ")),
    );
    _nameController.clear();
    _emailController.clear();
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: widget.onBack),
        title: const Text('Contact Me'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Let's Connect 🚀",
              style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Feel free to reach out for collaborations, opportunities or just to say hello!',
              style: theme.textTheme.bodySmall?.copyWith(height: 1.6),
            ),
            const SizedBox(height: 20),
            const ContactCard(
              icon: Icons.email,
              label: 'Email',
              value: AppConstants.email,
            ),
            const ContactCard(
              icon: Icons.phone,
              label: 'Phone',
              value: AppConstants.phone,
            ),
            const ContactCard(
              icon: Icons.code,
              label: 'GitHub',
              value: AppConstants.github,
            ),
            const ContactCard(
              icon: Icons.work,
              label: 'LinkedIn',
              value: AppConstants.linkedin,
            ),
            const SectionTitle('Send a Message'),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    validator: _required,
                    decoration: const InputDecoration(hintText: 'Your Name'),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || !value.contains('@')) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(hintText: 'Your Email'),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _messageController,
                    validator: _required,
                    maxLines: 4,
                    decoration: const InputDecoration(hintText: 'Message'),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: _sendMessage,
                      icon: const Icon(Icons.send, size: 18),
                      label: const Text('Send Message'),
                      style: FilledButton.styleFrom(
                        minimumSize: const Size(0, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
