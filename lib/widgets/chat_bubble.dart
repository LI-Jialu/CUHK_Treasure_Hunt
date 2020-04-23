import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:bubble/bubble.dart';

//class ChatBubble extends StatelessWidget {
//  bool sent_by_me;
//  String time;
//  String message;
//  ChatBubble({this.message, this.time, this.sent_by_me});
//
//
//  @override
//  Widget build(BuildContext context) {
////    int line = (message.length/15).round();
////    if (line==0)
////      {
////        line++;
////      }
////    double bubble_height = (line-1)*SizeConfig.safeBlockVertical*3+SizeConfig.safeBlockVertical*6;
//    int line = (message.length/15).round();
//    if (line==0)
//    {
//      line++;
//    }
//    double bubble_height = (line-1)*SizeConfig.safeBlockVertical*3+SizeConfig.safeBlockVertical*6;
//    double bubble_width;
//    if (message.length<25)
//      {
//        bubble_width = (message.length*2+6)*SizeConfig.safeBlockHorizontal;
//      }
//    else
//      {
//        bubble_width = SizeConfig.safeBlockHorizontal*55;
//      }
//    print("Line:$line: $message");
//    return Column(
//      children: <Widget>[
//        Center(
//          child: Container(
//            height: SizeConfig.safeBlockHorizontal*6,
//            width: SizeConfig.safeBlockVertical*10,
//            child: Container(
//              decoration: new BoxDecoration(
//                boxShadow: [
//                  new BoxShadow(
//                    color: Colors.black,
//                    offset: new Offset(1, 1),
//                    blurRadius: 2,
//                  )
//                ],
//                color: Colors.white,
//                borderRadius: BorderRadius.all(Radius.circular(10)),
//              ),
//              child: Center(
//                child: Text(time.substring(11,16),
//                style: TextStyle(fontSize: 14,letterSpacing: 1.4, color: Colors.grey,
//                fontWeight: FontWeight.w800),),
//              ),
//            ),
//          ),
//        ),
//        Container(
//          padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical*0.8,
//          horizontal: SizeConfig.safeBlockHorizontal*4),
//          child: Row(
//            mainAxisAlignment: sent_by_me?MainAxisAlignment.end:MainAxisAlignment.start,
//            children: <Widget>[
//            Container(
//              height: bubble_height,
//              width: bubble_width,
//              child: Container(
//                decoration: new BoxDecoration(
//                  boxShadow: [
//                    new BoxShadow(
//                      color: Colors.black,
//                      offset: new Offset(1, 1),
//                      blurRadius: 3,
//                    )
//                  ],
//                  color: Colors.teal,
//                  borderRadius: BorderRadius.all(Radius.circular(15)),
//                ),
//                child: Padding(
//                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//                  child: Text(message,
//                    style:
//                  TextStyle(
//                    color: Colors.white,
//                    fontSize: 16,
//                    height: 1.3,
//                    letterSpacing: 1,
//                    wordSpacing: 1.1,
//                  ),),
//                ),
//              ),
//            ),
//            ],
//          ),
//        ),
//        SizedBox(
//          height: SizeConfig.safeBlockVertical,
//        ),
//      ],
//    );
//  }
//}
class ChatBubble extends StatelessWidget {
  bool sent_by_me;
  String time;
  String message;
  ChatBubble({this.message, this.time, this.sent_by_me});

  @override
  Widget build(BuildContext context) {
    sent_by_me = !sent_by_me;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Bubble(
          color: sent_by_me?Colors.teal:Colors.white,
          margin: BubbleEdges.only(top: 10),
          nip: sent_by_me?BubbleNip.rightBottom:BubbleNip.leftBottom,
          child: Text(message,
            textAlign: sent_by_me?TextAlign.left:TextAlign.right,
          style: TextStyle(
            color: sent_by_me?Colors.white:Colors.black,
          ),),
        ),
      ],
    );
  }
}
