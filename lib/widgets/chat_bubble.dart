/*
Module to render the chat bubble in the message window

Module Name: Chat bubble
Programmer: Steve Tang
This Module takes in the message to be sent as string and renders them in chat bubbles
*/




import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';


class ChatBubble extends StatelessWidget {
  bool sent_by_me;
  //indicator to show whether this message was sent by the current logged in user
  String time;
  String message;
  //the chat bubble will render message content and sent time
  ChatBubble({this.message, this.time, this.sent_by_me});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: SizeConfig.safeBlockVertical*0.5),
      width: SizeConfig.screenWidth,
      child: Column(
        crossAxisAlignment: sent_by_me?CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: <Widget>[
          Bubble(
            padding: BubbleEdges.symmetric(vertical: SizeConfig.safeBlockVertical*0.8,
            horizontal: SizeConfig.safeBlockHorizontal*2),
            margin: BubbleEdges.symmetric(vertical: SizeConfig.safeBlockVertical*0.5),
            elevation: 2,
            color: sent_by_me?Colors.teal:Colors.white,
            nip: sent_by_me?BubbleNip.rightBottom:BubbleNip.leftBottom,
            //if sent_by_me is true, then chat bubble is on the right otherwise
            //the chat bubble is on the left
            child: Text(message,
              textAlign: TextAlign.left,
            style: TextStyle(
              color: sent_by_me?Colors.white:Colors.black,
              fontSize: 16
            ),),
          ),
        ],
      ),
    );
  }
}
