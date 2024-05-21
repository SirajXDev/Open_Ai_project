import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {required this.userInput, required this.sendMessage});

  final TextEditingController userInput;
  final VoidCallback sendMessage;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
