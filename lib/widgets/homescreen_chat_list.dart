import 'package:cuhk_treasure_hunt/screens/chatroom_screen.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:flutter/material.dart';

String search_keyword;

class HomeScreenChat extends StatefulWidget {
  const HomeScreenChat({Key key}) : super(key: key);

  @override
  _HomeScreenChatState createState() => _HomeScreenChatState();
}

class _HomeScreenChatState extends State<HomeScreenChat> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: SizeConfig.safeBlockVertical * 10,
          child: Center(
              child: Text(
            "Chat",
            style: khomescreen_title_textstyle,
          )),
        ),
        Container(
          height: SizeConfig.safeBlockVertical * 10,
          width: SizeConfig.safeBlockHorizontal * 80,
          child: TextField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            maxLines: 1,
            decoration: InputDecoration(hintText: 'Search'),
            onChanged: (value) {
              search_keyword = value;
              print(search_keyword);
            },
          ),
        ),
        ChatBody(),
      ],
    );
  }
}

// mainbody of the chat (body of the scaffold)
class ChatBody extends StatefulWidget {
  @override
  _ChatBodyState createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ChatListView(),
    );
  }
}

// the scrollable list of the chat contacts
class ChatListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _ChatListView(context);
  }

  Widget _ChatListView(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Row(
            children: <Widget>[
              ContactCard(),
            ],
          );
        });
  }
}

class ContactCard extends StatefulWidget {
  @override
  _ContactCardState createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatroomScreen()),
            );
          },
          child: Container(
          height: SizeConfig.safeBlockVertical * 10,
          width: SizeConfig.screenWidth,
          color: Colors.white,
            child: Row(
              children: <Widget>[
                Container(
                    height: SizeConfig.safeBlockVertical * 10,
                    width: SizeConfig.safeBlockVertical * 10,
                    child: Icon(
                      Icons.person,
                    )),
                Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Imane",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Container(
                      child: Text("Aloha"),
                    ),
                  ],
                ),
              ],
            ),
      ),
        ),
        Positioned(
          left: SizeConfig.safeBlockHorizontal*80,
          height: SizeConfig.safeBlockHorizontal*15,
          width: SizeConfig.safeBlockVertical*10,
          child: Container(
            child: Center(child: Text("12:00")),  //to connect to the backend for time
          ),
        ),
    ],
    );
  }
}
