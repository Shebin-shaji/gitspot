import 'package:flutter/material.dart';

class CustomPrimaryTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const CustomPrimaryTextField({
    super.key,
    required this.labelText,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.2,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1.5,
          ),
        ),

        filled: true,
        fillColor: Colors.transparent,
      ),
    );
  }
}
