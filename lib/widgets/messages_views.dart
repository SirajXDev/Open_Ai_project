import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  final bool isUser;
  final String message;
  final String date;

  const Messages({
    Key? key,
    required this.isUser,
    required this.message,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 15).copyWith(
          left: isUser ? 100 : 10,
          right: isUser ? 10 : MediaQuery.of(context).size.width * 0.09),
      decoration: BoxDecoration(
        color: isUser ? Colors.black : Colors.grey.shade400,
        borderRadius: BorderRadius.only(
          bottomLeft: const Radius.circular(30),
          topLeft: isUser ? const Radius.circular(30) : Radius.zero, // chat gpt
          topRight: const Radius.circular(30),
          bottomRight: isUser ? Radius.zero : const Radius.circular(10), // user
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            message,
            style: TextStyle(
              fontSize: 16,
              color: isUser ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SelectableText(
            date,
            style: TextStyle(
              fontSize: 15,
              color: isUser ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
