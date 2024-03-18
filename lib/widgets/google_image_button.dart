// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class GoogleImageButton extends StatelessWidget {
  const GoogleImageButton({
    super.key,
    required this.onTap,
  });
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        height: 50,
        width: 50,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              'assets/images/google.png',
              height: 24.0,
              width: 24,
            ),
          ),
        ),
      ),
    );
  }
}
