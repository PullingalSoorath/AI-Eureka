import 'dart:io';

import 'package:eureka/presentation/screen/chat_screen.dart';
import 'package:eureka/util/app_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit Application'),
            content: const Text('Are you sure you want to exit from the app?'),
            actions: [
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Theme.of(context).colorScheme.primaryContainer,
                  ),
                ),
                onPressed: () =>
                    Navigator.pop(exit(0)), // close the application
                child: const Text('Yes'),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Theme.of(context).colorScheme.primaryContainer,
                  ),
                ),
                onPressed: () => Navigator.pop(context, false), // Cancel pop
                child: const Text('No'),
              ),
            ],
          ),
        );
        return shouldPop ?? false; // Default to not popping
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          actions: [
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(
                Icons.logout,
              ),
            )
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: const Text(""),
        // ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Select your choice",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Chat with $appName",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: InkWell(
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const ImageToTextScreen(),
            //         ),
            //       );
            //     },
            //     child: Container(
            //       height: 80,
            //       decoration: BoxDecoration(
            //         color: Theme.of(context).colorScheme.primaryContainer,
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       alignment: Alignment.center,
            //       child: Text(
            //         "Image to text",
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           color: Theme.of(context).colorScheme.primary,
            //         ),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
