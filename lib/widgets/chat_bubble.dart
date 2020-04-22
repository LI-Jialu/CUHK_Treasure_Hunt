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
    int line = (message.length/15).round();
    if (line==0)
      {
        line++;
      }
    double bubble_height = (line-1)*SizeConfig.safeBlockVertical*2+SizeConfig.safeBlockVertical*5;
    double bubble_width;
    if (message.length<25)
      {
        bubble_width = (message.length*2+5)*SizeConfig.safeBlockHorizontal;
      }
    else
      {
        bubble_width = SizeConfig.safeBlockHorizontal*55;
      }

    return Column(
      children: <Widget>[
        Center(
          child: Container(
            child: Text(time),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical*0.5,
          horizontal: SizeConfig.safeBlockHorizontal*4),
          child: Row(
            mainAxisAlignment: sent_by_me?MainAxisAlignment.end:MainAxisAlignment.start,
            children: <Widget>[
            Container(
              height: bubble_height,
              width: bubble_width,
              child: Container(
                decoration: new BoxDecoration(
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.black,
                      offset: new Offset(1, 1),
                      blurRadius: 3,
                    )
                  ],
                  color: Colors.teal,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(message,
                    style:
                  TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),),
                ),
              ),
            ),
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.safeBlockVertical,
        ),
      ],
    );
  }
}
