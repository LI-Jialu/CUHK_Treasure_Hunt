import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cuhk_treasure_hunt/widgets/chat_bubble.dart';
import 'dart:collection';

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
  void initState() {
    super.initState();
      get_message_async();
      //  print(message_info_decoded[0]['message']);
    _messageStatus = ValueNotifier<dynamic>(message_info_decoded);
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
              if (value == null) return Text('loading...');
              else return Expanded(
                child: Stack(
                  children: <Widget>[
                    Container(
                      color: Colors.amber,),
                    Container(
                      child: ListView.builder(
                          reverse: true,
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                            bool sent_by_me;
                            if (widget.user_id !=
                                value[index]['sender_id']) {
                              sent_by_me = true;
                            }
                            else {
                              sent_by_me = false;
                            }
                            print(sent_by_me);
                            return ChatBubble(
                              message: value[index]['message'],
                              time: value[index]['create_time'],
                              sent_by_me: sent_by_me,);
                          }),
                    ),
                  ],
                ),
              );
              }

          ),
          //lower part(keyboard)
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
