/*
Module to render the chat room screen for user to view and type messages

Module Name: Chat room screen
Programmer: Steve Tang
This Module takes in 
*/

import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cuhk_treasure_hunt/widgets/chat_bubble.dart';
import 'dart:collection';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';

class ChatroomScreen extends StatefulWidget {
  String user_id;
  String contact_name;
  ChatroomScreen({this.contact_name, this.user_id});

  @override
  _ChatroomScreenState createState() => _ChatroomScreenState();
}

class _ChatroomScreenState extends State<ChatroomScreen> {

  ValueNotifier<dynamic> _messageStatus = ValueNotifier<dynamic>(null);

  //static variables
  var message_info_decoded;

  Timer _everyFiveSecond;
  String input_message;
  var _inputtextController = TextEditingController();
  @override
  void dispose (){
    super.dispose();
    _everyFiveSecond.cancel();
  }

  @override
  void initState() {
    super.initState();
      get_message_async();
      //  print(message_info_decoded[0]['message']);
    _messageStatus.value = message_info_decoded;
    _everyFiveSecond = Timer.periodic(Duration(seconds: 5), (Timer t){
      get_message_async();
      _messageStatus.value = message_info_decoded;
    });
  }

  void get_message_async() async {
    var user_id = widget.user_id;
    print(user_id);
    var message_async = await Database.get("/data/messages.php", "?contact_id=$user_id");
    if (message_async.body==null) {
      print("null");
    }
    else
      {
        print("Not null");
        message_info_decoded = json.decode(message_async.body);
      }
  }

  void send_message(String receiver_id, String message) async {
    var result = await Database.post(
        '/data/manageMessages.php', {"receiver_id": "$receiver_id",
      "message": "$message"});
    print(result);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contact_name),
      ),
      body: Column(
        children: <Widget>[
          ValueListenableBuilder(
            valueListenable: _messageStatus,
              builder: (BuildContext context, dynamic value, Widget child){
              if (value == null) return Expanded(
                child: Container(
                  color: Colors.amber,
                  child: Center(
                    child: Container(
                      color: Colors.amber,
                      width: SizeConfig.safeBlockHorizontal*30,
                      height: SizeConfig.safeBlockVertical*30,
                      child: SpinKitWave(
                        color: Colors.white,
                        size: 100.0,
                      ),
                    ),
                  ),
                ),
              );
              else return Expanded(
                child: Stack(
                  children: <Widget>[
                    Container(
                      color: Colors.amber,),
                    Container(
                      padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*3,
                      right: SizeConfig.safeBlockHorizontal*3),
                      child: ListView.builder(
                          reverse: true,
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                            bool sent_by_me;
                            if (widget.user_id !=
                                value[index]['receiver_id']) {
                              sent_by_me = true;
                            }
                            else {
                              sent_by_me = false;
                            }
                            print(sent_by_me);
                            return ChatBubble(
                              message: value[index]['message'],
                              time: value[index]['create_time'],
                              sent_by_me: !sent_by_me,);
                          }),
                    ),
                  ],
                ),
              );
              }

          ),
          //lower part(keyboard)
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFF1F1F1),
              width: 2)
//              boxShadow: [
//                BoxShadow(
//                  color: Colors.black,
//                  blurRadius: 2.0,
//                  spreadRadius: 0.0,
//                  offset: Offset(2.0, 2.0),
//                ),
//              ],
            ),

            height: SizeConfig.safeBlockVertical * 14,
            width: SizeConfig.screenWidth,
            child: Row(
              children: <Widget>[
//                Container(
//                  height: SizeConfig.safeBlockVertical * 10,
//                  width: SizeConfig.safeBlockVertical * 10,
//                  child: Icon(Icons.mic),
//                ),
                Expanded(
                  child: Container(
                    padding:EdgeInsets.only(bottom: SizeConfig.safeBlockVertical*7,
                    top:SizeConfig.safeBlockVertical*1, right: SizeConfig.safeBlockHorizontal*4,
                    left: SizeConfig.safeBlockHorizontal*4),
//                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal*4,
//                    vertical: SizeConfig.safeBlockVertical*1.3),
                    height: SizeConfig.safeBlockVertical * 14,
                    child: TextField(
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                      controller: _inputtextController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                      ),
                      onSubmitted: (term) {
//                        _inputtextController.clear();
                      },
//                      maxLines: 1,
                      onChanged: (value) {
                        input_message = value;
                        print(input_message);
                      },
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      onPressed: (){
                        if (input_message!=null)
                          {
                            send_message(widget.user_id, input_message);
                            _inputtextController.clear();
                          }
                      },
                      iconSize:  SizeConfig.safeBlockVertical * 5,
                      icon: Icon(Icons.send, color: Colors.teal,),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
