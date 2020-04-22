import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';

class ChatBubble extends StatelessWidget {
  bool sent_by_me;
  String time;
  String message;
  ChatBubble({this.message, this.time, this.sent_by_me});


  @override
  Widget build(BuildContext context) {
    int line = (message.length/10).round();
    double bubble_height = line*SizeConfig.safeBlockHorizontal*8;
    double bubble_width;
    if (message.length<10)
      {
        bubble_width = message.length*SizeConfig.safeBlockHorizontal*6;
      }
    else
      {
        bubble_width = SizeConfig.safeBlockHorizontal*60;
      }

    return Container(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical*0.5),
      child: Row(
        mainAxisAlignment: sent_by_me?MainAxisAlignment.end:MainAxisAlignment.start,
        children: <Widget>[
        Container(
          height: bubble_height,
          width: bubble_width,

          child: Container(
            decoration: new BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(message, style: TextStyle(
                fontSize: 16,
              ),),
            ),
          ),
        ),
        ],
      ),
    );
  }
}
