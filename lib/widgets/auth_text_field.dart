import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthTextField extends StatefulWidget {
  AuthTextField({
    super.key,
    required this.hintText,
    this.controller,
    required this.obscureText,
    required this.enableObscureText,
    required this.validator,
  });
  final String hintText;
  final TextEditingController? controller;
  final FormFieldValidator validator;
  late bool obscureText;
  late bool enableObscureText;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
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
          controller: widget.controller,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            suffixIcon: Visibility(
              visible: widget.enableObscureText,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                },
                icon: Icon(
                  widget.obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            fillColor: Theme.of(context).colorScheme.onBackground,
            filled: true,
            hintText: widget.hintText,
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
