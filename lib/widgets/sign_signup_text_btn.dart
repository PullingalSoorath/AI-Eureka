import 'package:flutter/material.dart';

class AccountAuthText extends StatelessWidget {
  const AccountAuthText({
    super.key,
    required this.text1,
    required this.text2,
    this.onTap,
  });
  final String text1;
  final String text2;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: text1),
            TextSpan(
              text: text2,
              style: const TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
