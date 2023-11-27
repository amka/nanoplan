import 'package:flutter/material.dart';

class APTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final bool autofocus;
  final TextInputType keyboardType;

  final String? Function(String?)? validator;

  const APTextField({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.autofocus = false,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  final border = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: autofocus,
      obscureText: obscureText,
      decoration: InputDecoration(
        // enabledBorder: border,
        // focusedBorder: border,
        // errorBorder: border,
        border: border,
        filled: true,
        hintText: hintText,
        labelText: labelText,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
      ),
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}
