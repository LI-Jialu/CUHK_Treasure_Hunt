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
Future<Response> message_info;
var message_info_decoded;
var user_id;

class message_pack{
  message_pack({this.message,this.time, this.sender});
  String message;
  String time;
  String sender;
}

class ChatroomScreen extends StatefulWidget {
  String user_id;
  String contact_name;
  ChatroomScreen({this.contact_name, this.user_id});


  @override
  _ChatroomScreenState createState() => _ChatroomScreenState();
}

class _ChatroomScreenState extends State<ChatroomScreen> {
//  Future<Response> message_info;

  List<message_pack> message_pack_list = [test];
  static message_pack test = new message_pack(
      sender: "a", message: "a", time: "a");



  @override
  void initState() {
    super.initState();
    user_id = widget.user_id;
    get_message();
  }

  void get_message() {
    var user_id = widget.user_id;
    print(user_id);
    message_info = Database.get("/data/messages.php", "?contact_id=$user_id");
  }

  void get_message_async() async {
    var user_id = widget.user_id;
    print(user_id);
    var message_async = await Database.get(
        "/data/messages.php", "?contact_id=$user_id");
    message_info_decoded = json.decode(message_async.body);
  }

  void send_message(String receiver_id, String message) async {
    var result = await Database.post(
        '/data/manageMessages.php', {"receiver_id": "$receiver_id",
      "message": "$message"});
    print(result);
  }

  var _inputtextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: message_info,
      builder: (BuildContext context, AsyncSnapshot snapshot) {

        if (snapshot.hasData) {
          message_info_decoded = json.decode(snapshot.data.body);
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.contact_name),
              elevation: 0,
            ),
            body: BubbleList(),
          );
        }
        else {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.contact_name),
              elevation: 0,
            ),
            body: Column(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Container(
                      width: SizeConfig.safeBlockHorizontal * 30,
                      height: SizeConfig.safeBlockVertical * 30,
                      child: SpinKitWave(
                        color: Colors.teal,
                        size: 100.0,
                      ),
                    ),
                  ),
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
                            controller: _inputtextController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.send,
                            onSubmitted: (term) {
                              send_message(widget.user_id, input_message);
                              _inputtextController.clear();
//                        message_pack newpack = new message_pack(
//                            message: input_message, time: "a", sender: widget.user_id);
//                        message_pack_list.add(newpack);
                              get_message_async();
                              setState(() {
                              });
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
      },
    );
  }
}

class BubbleList extends StatefulWidget {
  @override
  _BubbleListState createState() => _BubbleListState();
}

class _BubbleListState extends State<BubbleList> {


  var _inputtextController = TextEditingController();
  void send_message(String receiver_id, String message) async {
    var result = await Database.post(
        '/data/manageMessages.php', {"receiver_id": "$receiver_id",
      "message": "$message"});
    print(result);
  }

  void get_message_async() async {
    print(user_id);
    var message_async = await Database.get(
        "/data/messages.php", "?contact_id=$user_id");
    message_info_decoded = json.decode(message_async.body);
  }

  void get_message() {
    print(user_id);
    message_info = Database.get("/data/messages.php", "?contact_id=$user_id");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Stack(
            children: <Widget>[
              Container(
                color: Colors.amber,),
              Container(

                child: ListView.builder(
                    reverse: true,
                    itemCount: message_info_decoded.length,
                    itemBuilder: (context, index) {
                      print("message——number$message_info_decoded.length");
                      bool sent_by_me;
                      if (user_id !=
                          message_info_decoded[index]['sender_id']) {
                        sent_by_me = true;
                      }
                      else {
                        sent_by_me = false;
                      }
//                            sent_by_me=(widget.user_id!=message_info_decoded[index]['reveiver_id'])?true:false;
                      print(sent_by_me);
                      return ChatBubble(
                        message: message_info_decoded[index]['message'],
                        time: message_info_decoded[index]['create_time'],
                        sent_by_me: sent_by_me,);
                    }),
              ),
            ],
          ),
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
                    controller: _inputtextController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (term) {
                      send_message(user_id, input_message);
                      _inputtextController.clear();
//                        message_pack newpack = new message_pack(
//                            message: input_message, time: "a", sender: widget.user_id);
//                        message_pack_list.add(newpack);
                      get_message_async();
                      setState(() {

                      });
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
    );
  }
}