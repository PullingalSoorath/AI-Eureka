import 'package:eureka/util/app_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    Key? key,
    required this.message,
    required this.isFromUser,
  }) : super(key: key);

  final String message;
  final bool isFromUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Visibility(
          visible: isFromUser,
          child: const SizedBox(width: 40),
        ),
        Flexible(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.8,
            ),
            decoration: BoxDecoration(
              color: isFromUser
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            margin: const EdgeInsets.only(bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isFromUser
                      ? "${FirebaseAuth.instance.currentUser?.displayName}"
                      : "$appName",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Divider(
                  color: isFromUser
                      ? Theme.of(context).colorScheme.background
                      : Theme.of(context).colorScheme.primary,
                ),
                MarkdownBody(
                  data: message,
                  selectable: true,
                  styleSheet: MarkdownStyleSheet(
                      code: TextStyle(
                          // color: codeColor,
                          backgroundColor: Colors.transparent),
                      codeblockDecoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.grey.shade900
                            : Color.fromARGB(255, 203, 203, 203),
                      )
                      // a: TextStyle(
                      //   color: Colors.amber,
                      // ),
                      // p: TextStyle(
                      //   color: Colors.white,
                      // ),
                      ),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: !isFromUser,
          child: const SizedBox(width: 40),
        ),
      ],
    );
  }
}
