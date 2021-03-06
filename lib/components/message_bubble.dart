import 'package:flutter/material.dart';


class MessageBubble extends StatelessWidget {
  final String text;
  final String sender;
  final bool isMe;
  //final num msgId;
  MessageBubble({this.sender, this.text,this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:isMe ? CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(fontSize: 12.0, color: Colors.black54),
          ),
          Material(
            elevation: 5.0,
            borderRadius:isMe ? BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
              topLeft :Radius.circular(30.0),
              
              ):BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
              topRight :Radius.circular(30.0),
              ),
            color: isMe ? Colors.lightBlueAccent:Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(text,
                  style: TextStyle(fontSize: 15, color:isMe? Colors.white:Colors.black54)),
            ),
          ),
        ],
      ),
    );
  }
}
