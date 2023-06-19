import '../constants/constants.dart';

class Message {
  final String message;
  final String id;


  Message(this.message, this.id, );

  factory Message.fromJason(jasonData) =>
      Message(jasonData[kMessage], jasonData['id']);
}
