import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../components/chat_bubble.dart';

class ChatScreen extends StatelessWidget {

  static String id="chat_screen";
  CollectionReference messages = FirebaseFirestore.instance.collection(kMessagesCollection);
  TextEditingController textEditingController =TextEditingController();
  ScrollController scrollController= ScrollController();

  @override
  Widget build(BuildContext context) {
  String  email= ModalRoute.of(context)!.settings.arguments as String ;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt,descending: true).snapshots(),
      builder: (context,snapshot){
       if(snapshot.hasData){
         List<Message> messagesList =[];
         for(int i=0;i<snapshot.data!.docs.length;i++){
           messagesList.add(Message.fromJason(snapshot.data!.docs[i]));
         }
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
             body:Column(
               children: [
                 Expanded(
                   child: ListView.builder(
                     reverse: true,
                     controller: scrollController,
                     itemCount: messagesList.length,
                       itemBuilder: (context,index){
                     return messagesList[index].id == email ?
                     MyChatBubble(message:messagesList[index].message) :
                     FriendChatBubble(message:messagesList[index].message);
                   }),
                 ) ,
                 Padding(
                   padding: const EdgeInsets.all(16.0),
                   child: TextField(
                     controller: textEditingController,
                     decoration: InputDecoration(
                       hintText: 'Send Message',
                       suffixIcon: Icon(
                         Icons.send,
                         color: kPrimaryColor,
                       ),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(16),
                       ),
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(16),
                         borderSide: BorderSide(
                           color: kPrimaryColor,
                         ),
                       ),
                     ),
                     onSubmitted:(data){
                       messages.add({
                         kMessage: data,
                         kCreatedAt : DateTime.now(),
                         'id' : email,
                       });
                       textEditingController.clear();
                       scrollController.animateTo(
                         0,
                         duration: Duration(seconds: 1),
                         curve: Curves.fastOutSlowIn,
                       );
                     },

                   ),
                 )
               ],
             )
         );
       }else return Text("loading");
      }
    );
  }
}


