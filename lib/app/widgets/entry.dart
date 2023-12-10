import 'package:flutter/material.dart';

class Entry extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final bool autofocus;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool enabled;

  const Entry({
    super.key,
    required this.controller,
    this.label,
    this.validator,
    this.obscureText = false,
    this.autofocus = false,
    this.keyboardType = TextInputType.text,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Theme.of(context).colorScheme.primary.withAlpha(45),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.onBackground,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
      style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
      autofocus: autofocus,
      obscureText: obscureText,
      validator: validator,
      enabled: enabled,
      keyboardType: keyboardType,
    );
  }
}
