import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Widget prefixIcon;
  final Widget? suffixIcon;

  CustomLabel({
    super.key,
    required this.controller,
    required this.hint,
    required this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        style: Theme.of(context).textTheme.bodyLarge,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(prefixIcon: prefixIcon, hintText: hint));
  }
}
