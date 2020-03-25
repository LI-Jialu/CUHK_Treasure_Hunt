import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';

String input_message;

class ChatroomScreen extends StatefulWidget {
  @override
  _ChatroomScreenState createState() => _ChatroomScreenState();
}

class _ChatroomScreenState extends State<ChatroomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Imane"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.amber,
            ),
          ),
          Container(
            height: SizeConfig.safeBlockVertical*10,
            width: SizeConfig.screenWidth,
            child: Row(
              children: <Widget>[
                Container(
                  height: SizeConfig.safeBlockVertical*10,
                  width: SizeConfig.safeBlockVertical*10,
                  child: Icon(Icons.mic),
                ),
                Expanded(
                  child: Container(
                    height: SizeConfig.safeBlockVertical*10,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.send,
                      maxLines: 1,
                      onChanged: (value){
                        input_message = value;
                        print(input_message);
                      },
                    ),
                  ),
                ),
                Container(
                  height: SizeConfig.safeBlockVertical*10,
                  width: SizeConfig.safeBlockVertical*10,
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
