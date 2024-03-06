import 'package:eureka/screen/chat_screen.dart';
import 'package:eureka/screen/image_to_text_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                color: Colors.blue[100],
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Chat with Ai",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ImageToTextScreen(),
                  ),
                );
              },
              child: Container(
                height: 80,
                color: Colors.blue[100],
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Image to text",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       FilledButton(
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => const ChatScreen(),
      //             ),
      //           );
      //         },
      //         child: const Text("Chat"),
      //       ),
      //       FilledButton(
      //         onPressed: () {
      //           MaterialPageRoute(
      //             builder: (context) => const ImageToTextScreen(),
      //           );
      //         },
      //         child: const Text("Text To Image"),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
