import 'dart:io';

import 'package:eureka/presentation/screen/chat_screen.dart';
import 'package:eureka/util/app_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String _userName = '';
  String _emailId = '';

  @override
  void initState() {
    super.initState();
    _getUserInfo();
  }

  Future<void> _getUserInfo() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _userName = user.displayName ?? '';
        _emailId = user.email ?? '';
      });
    }
  }

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
        ),
        endDrawer: Drawer(
          backgroundColor: Theme.of(context).colorScheme.background,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                ),
                accountName: Text(
                  _userName,
                ),
                accountEmail: Text(
                  _emailId,
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(
                    FirebaseAuth.instance.currentUser!.photoURL == null
                        ? 'assets/images/profile_bg.png'
                        : FirebaseAuth.instance.currentUser!.photoURL!,
                  ),
                ),
              ),
              // ListTile(
              //   title: Text('Profile'),
              //   onTap: () {
              //     // Navigate to profile screen
              //     Navigator.pop(context); // Close the drawer
              //     // Add your navigation logic here
              //   },
              // ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Logout',
                    ),
                    Icon(
                      Icons.logout_sharp,
                    ),
                  ],
                ),
                onTap: () {
                  // Implement logout functionality
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context); // Close the drawer
                  // Add your logout logic here
                },
              ),
            ],
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
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
          ],
        ),
      ),
    );
  }
}
