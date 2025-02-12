import 'package:flutter/material.dart';

class CustomCheckField extends StatefulWidget {
  final bool isChecked;
  final String labelText;
  final ValueChanged<bool>? onChanged; // Callback to notify parent

  CustomCheckField({
    super.key,
    required this.isChecked,
    required this.labelText,
    this.onChanged,
  });

  @override
  State<CustomCheckField> createState() => _CustomCheckFieldState();
}

class _CustomCheckFieldState extends State<CustomCheckField> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked; // Initialize state from widget property
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true, // Prevents typing inside the field
      decoration: InputDecoration(
        labelText: widget.labelText, // Use widget.labelText
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        suffixIcon: Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value ?? false;
            });
            widget.onChanged?.call(isChecked); // Notify parent about change
          },
        ),
      ),
    );
  }
}
