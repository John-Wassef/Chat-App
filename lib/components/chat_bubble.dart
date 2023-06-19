import 'package:flutter/material.dart';

import '../constants/constants.dart';

class MyChatBubble extends StatelessWidget {
   MyChatBubble({required this.message});
  String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(8),
        child: Text(
          "$message",
          style: TextStyle(
              color: Colors.white
          ),

        ),
        decoration: BoxDecoration(
            color:kPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),

            )
        ),

      ),
    );
  }
}


class FriendChatBubble extends StatelessWidget {
  FriendChatBubble({required this.message});
  String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(8),
        child: Text(
          "$message",
          style: TextStyle(
              color: Colors.white
          ),

        ),
        decoration: BoxDecoration(
            color:Color(0xff006d84),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32),

            )
        ),

      ),
    );
  }
}