import 'package:dawaay/constants/dawaay_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MessageWidget extends StatelessWidget {
  final String text;
  final bool isFromUser;

  const MessageWidget(
      {super.key, required this.text, required this.isFromUser});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Flexible(
        child: Container(
          margin: EdgeInsets.only(
            left: isFromUser ? 10 : 20,
            right: isFromUser ? 10 : 0,
            top: 10,
            bottom: 10,
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          decoration: BoxDecoration(
            color: isFromUser ? DawaayColors.kprimaryColor : Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8,

            ///520
          ),
          child: Column(
            children: [
              MarkdownBody(
                data: text,
                styleSheet: MarkdownStyleSheet(
                  p: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
