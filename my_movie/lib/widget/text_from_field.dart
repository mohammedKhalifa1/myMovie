import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  final String hint;
  final VoidCallback onTap;
  final bool active;
  const CustomTextFromField({
    super.key,
    required this.hint,
    required this.onTap,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.white)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.white)),
          hintText: hint,
          suffixIcon: active == true
              ? TextButton(
                  onPressed: onTap,
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ))
              : null,
          hintStyle: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
