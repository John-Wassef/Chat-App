import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ChatBubble extends StatelessWidget {
   ChatBubble({required this.message});
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