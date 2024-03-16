import 'package:eureka/presentation/screen/auth_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.9,
              color: Theme.of(context).colorScheme.background,
            ),
            Divider(
              color: Theme.of(context).colorScheme.primary,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuthScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'skip to continue ',
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
