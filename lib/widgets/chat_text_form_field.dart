import 'package:flutter/material.dart';

class ChatTextFormField extends StatelessWidget {
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final bool isReadOnly;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onchanged;
  final String? errorText;

  const ChatTextFormField({
    super.key,
    this.focusNode,
    this.controller,
    this.isReadOnly = false,
    required this.onFieldSubmitted,
    this.onchanged, this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchanged,
      autofocus: true,
      autocorrect: false,
      focusNode: focusNode,
      controller: controller,
      readOnly: isReadOnly,
      onFieldSubmitted: onFieldSubmitted,
      decoration: const InputDecoration(
        hintText: "Enter your prompt here",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),
        contentPadding: EdgeInsets.all(10),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter a prompt.";
        }
        return null;
      },
    );
  }
}
