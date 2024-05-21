import 'package:chat_gpt_app_using_flutter/models/messages_model.dart';
import 'package:flutter/material.dart';

class MessagesContainer extends StatelessWidget {
  MessagesContainer({super.key});

  late Message message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 15).copyWith(
          left: message.isUser ? 100 : 10,
          right:
              message.isUser ? 10 : MediaQuery.of(context).size.width * 0.05),
      decoration: BoxDecoration(
        color: message.isUser ? Colors.blueAccent : Colors.grey.shade400,
        borderRadius: BorderRadius.only(
          bottomLeft: const Radius.circular(30),
          topLeft: message.isUser ? const Radius.circular(30) : Radius.zero,
          topRight: const Radius.circular(30),
          bottomRight: message.isUser ? Radius.zero : const Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            message.message,
            style: TextStyle(
              fontSize: 20,
              color: message.isUser ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '${message.date}',
            style: TextStyle(
              fontSize: 15,
              color: message.isUser ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
