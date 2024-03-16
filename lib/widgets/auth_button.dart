import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.buttonName,
    this.onTap,
  });
  final String buttonName;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.width * 0.13,
        width: MediaQuery.of(context).size.width * 0.9,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(Colors.blue),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          onPressed: onTap,
          child: Text(
            buttonName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
