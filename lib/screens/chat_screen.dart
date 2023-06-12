import 'package:chat_app/constants/constants.dart';
import 'package:flutter/material.dart';

import '../components/chat_bubble.dart';

class ChatScreen extends StatelessWidget {

  static String id="chat_screen";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Image.asset(
                kLogoImage,
                height: 50,
              ),
            Text("Chat",
              style: TextStyle(
                color: Colors.white
              ),
            )
          ],
        ),
      ),
      body:ListView.builder(itemBuilder: (context,index){
        return ChatBubble(message: "hello my name is john");
      }) ,
    );
  }
}


