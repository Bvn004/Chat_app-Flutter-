import 'package:flutter/material.dart';

class Chatbubble extends StatelessWidget {
  Chatbubble({super.key, required this.Message, required this.iscurrentuser});

  String Message;
  bool iscurrentuser;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: iscurrentuser ? Colors.green : Colors.grey,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      child: Text(
        Message,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
