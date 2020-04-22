import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cuhk_treasure_hunt/widgets/chat_bubble.dart';
import 'dart:collection';

String input_message;

class ChatroomScreen extends StatefulWidget {
  String user_id;
  String contact_name;
  ChatroomScreen({this.contact_name, this.user_id});

  @override
  _ChatroomScreenState createState() => _ChatroomScreenState();
}

class _ChatroomScreenState extends State<ChatroomScreen> {
//  Future<Response> message_info;
  Future<Response> message_info;

  var message_info_decoded;
  @override
  void initState() {
    super.initState();
    get_message();
  }
  void get_message(){
    var user_id = widget.user_id;
    print(user_id);
    message_info = Database.get("/data/messages.php", "?contact_id=$user_id");

  }

  void send_message(String receiver_id, String message)async{
    var result = await Database.post('/data/manageMessages.php', {"receiver_id":"$receiver_id",
      "message":"$message"});
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contact_name),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
        FutureBuilder(
        future: message_info,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (snapshot.hasData)
          {
            message_info_decoded = json.decode(snapshot.data.body);
            print(message_info_decoded);
            print(message_info_decoded.length);
            return Expanded(
              child: Stack(
                children: <Widget>[
                    Container(
                    color: Colors.amber,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal*4),
                      child: ListView.builder(
                        itemCount: message_info_decoded.length,
                          itemBuilder: (context, index)
                          {
                            print(widget.user_id);
                            print(message_info_decoded[index]['sender_id']);
                            bool sent_by_me;
                            if (widget.user_id!=message_info_decoded[index]['sender_id'])
                              {
                                sent_by_me=true;
                              }
                            else {
                              sent_by_me=false;
                              }
//                            sent_by_me=(widget.user_id!=message_info_decoded[index]['reveiver_id'])?true:false;
                            print(sent_by_me);
                            return ChatBubble(message: message_info_decoded[index]['message'],
                            time: message_info_decoded[index]['create_time'],
                            sent_by_me: sent_by_me,);
                          }),
                    ),
                ],
              ),
            );
          }
          else
          {
            return Expanded(
              child: Center(
                child: Container(
                  width: SizeConfig.safeBlockHorizontal*30,
                  height: SizeConfig.safeBlockVertical*30,
                  child: SpinKitWave(
                    color: Colors.teal,
                    size: 100.0,
                  ),
                ),
              ),
            );
          }
        },
      ),

          Container(
            height: SizeConfig.safeBlockVertical * 10,
            width: SizeConfig.screenWidth,
            child: Row(
              children: <Widget>[
                Container(
                  height: SizeConfig.safeBlockVertical * 10,
                  width: SizeConfig.safeBlockVertical * 10,
                  child: Icon(Icons.mic),
                ),
                Expanded(
                  child: Container(
                    height: SizeConfig.safeBlockVertical * 10,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (term){
                        send_message(widget.user_id, input_message);
                      },
//                      maxLines: 1,
                      onChanged: (value) {
                        input_message = value;
                        print(input_message);
                      },
                    ),
                  ),
                ),
                Container(
                  height: SizeConfig.safeBlockVertical * 10,
                  width: SizeConfig.safeBlockVertical * 10,
                  child: Icon(Icons.add_circle),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }
}
