import 'package:flutter/material.dart';

import '../constants/constants.dart';

class MyChatBubble extends StatelessWidget {
   MyChatBubble({super.key, required this.message});
  String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color:kPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),

            )
        ),
        child: Text(
          message,
          style: const TextStyle(
              color: Colors.white
          ),

        ),

      ),
    );
  }
}


class FriendChatBubble extends StatelessWidget {
  FriendChatBubble({super.key, required this.message});
  String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Color(0xff006D84),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32),

            )
        ),
        child: Text(
          message,
          style: const TextStyle(
              color: Colors.white
          ),

        ),

      ),
    );
  }
}