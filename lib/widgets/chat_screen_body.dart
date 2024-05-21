import 'package:chat_gpt_app_using_flutter/models/messages_model.dart';
import 'package:chat_gpt_app_using_flutter/widgets/messages_views.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatScreenBody extends StatelessWidget {
  const ChatScreenBody(
      {required this.userInput,
      required this.scrollController,
      required this.sendMessage});

  final TextEditingController userInput;
  final ScrollController scrollController;
  final VoidCallback sendMessage;

  static List<Message> messages = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Messages(
                  isUser: message.isUser,
                  message: message.message,
                  date: DateFormat('HH:mm').format(message.date),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 15,
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: userInput,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        label: const Text('Enter Your Message')),
                  ),
                ),
                const Spacer(),
                IconButton(
                  padding: const EdgeInsets.all(12),
                  iconSize: 30,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(const CircleBorder()),
                  ),
                  onPressed: sendMessage,
                  icon: const Icon(Icons.send),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
