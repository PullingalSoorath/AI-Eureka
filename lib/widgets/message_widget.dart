import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    required this.message,
    required this.isFormUser,
  });

  final String message;
  final bool isFormUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isFormUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Visibility(
          visible: isFormUser,
          child: const SizedBox(
            width: 40,
          ),
        ),
        Flexible(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 80,
            ),
            decoration: BoxDecoration(
              color: isFormUser
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            margin: const EdgeInsets.only(
              bottom: 10,
            ),
            child: MarkdownBody(
              data: message,
            ),
          ),
        ),
        Visibility(
          visible: !isFormUser,
          child: const SizedBox(
            width: 40,
          ),
        ),
      ],
    );
  }
}
