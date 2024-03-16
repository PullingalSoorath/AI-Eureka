import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.hintText,
    this.controller,
  });
  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8.0,
      ),
      child: SizedBox(
        height: 60,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            fillColor: Theme.of(context).colorScheme.onBackground,
            filled: true,
            hintText: hintText,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
