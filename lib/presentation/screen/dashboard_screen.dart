import 'dart:io';
import 'package:animated_background/animated_background.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:eureka/presentation/screen/chat_screen.dart';
import 'package:eureka/util/app_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
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
                  backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.primaryContainer,
                  ),
                ),
                onPressed: () =>
                    Navigator.pop(exit(0)), // close the application
                child: const Text('Yes'),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
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
          foregroundColor: Theme.of(context).colorScheme.primary,
          // backgroundColor: Theme.of(context).colorScheme.surface,
          forceMaterialTransparency: true,
        ),
        endDrawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.9,
          backgroundColor: Theme.of(context).colorScheme.surface,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                ),
                accountName: Text(
                  _userName,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                accountEmail: Text(
                  _emailId,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: FirebaseAuth.instance.currentUser?.photoURL ?? '',
                    placeholder: (context, url) => ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Container(
                        height: 180,
                        width: 180,
                        color: Colors.white60,
                        child: Padding(
                          padding: const EdgeInsets.all(70.0),
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            backgroundColor: Colors.blue.withOpacity(.5),
                            strokeWidth: 2,
                          ),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: const Color.fromARGB(255, 81, 81, 81),
                        child: const Icon(Icons.person),
                      ),
                    ),
                  ),
                ),
                // currentAccountPictureSize: Size(100, 100),
              ),
              ListTile(
                title: Text(
                  'License',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                onTap: () {
                  showLicensePage(
                    context: context,
                    applicationName: 'AutoBotAI',
                    applicationVersion: '1.0.0',
                    applicationIcon: Image.asset(
                      'assets/images/app_icon.jpeg',
                      width: 60,
                      height: 60,
                    ),
                  );
                  ;
                },
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Logout',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Icon(
                      Icons.logout_sharp,
                      color: Theme.of(context).colorScheme.primary,
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
        backgroundColor: Theme.of(context).colorScheme.secondary,
        body: AnimatedBackground(
          behaviour: RandomParticleBehaviour(
            options: ParticleOptions(
              spawnMaxSpeed: 50.0,
              spawnMinSpeed: 10.0,
              spawnMaxRadius: 10.0,
              spawnMinRadius: 10.0,
              particleCount: 40,
              spawnOpacity: 0.1,
              minOpacity: 0.5,
              maxOpacity: 0.5,
              baseColor: Colors.blue,
            ),
          ),
          vsync: this,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Select your choice",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
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
                      color: Theme.of(context)
                          .colorScheme
                          .primaryContainer
                          .withOpacity(0.8),
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
      ),
    );
  }
}
