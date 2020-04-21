import 'package:cuhk_treasure_hunt/screens/chatroom_screen.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'package:http/http.dart';
import 'dart:convert';

String search_keyword;

class HomeScreenChat extends StatefulWidget {
  const HomeScreenChat({Key key}) : super(key: key);


  @override
  _HomeScreenChatState createState() => _HomeScreenChatState();
}


class _HomeScreenChatState extends State<HomeScreenChat> {

  bool contact_retrieve_status = false;

  Future get_contact_list() async{
    var contact_list = await Database.get('/data/contactList.php', '');
    var result = json.decode(contact_list.body);
    print(contact_list.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_contact_list();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: get_contact_list(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.connectionState==true)
          {
            return Column(
              children: <Widget>[
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
        else
          {
            return Center(
              child: Container(
                width: SizeConfig.safeBlockHorizontal*30,
                height: SizeConfig.safeBlockVertical*30,
                child: SpinKitWave(
                  color: Colors.teal,
                  size: 100.0,
                ),
              ),
            );
          }
      },
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
class ChatListView extends StatefulWidget {
  @override
  _ChatListViewState createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Dismissible(
                onDismissed: (DismissDirection direction){
                  setState(() {
                    //remove
                  });
                },
                child: ContactCard(),
                key: UniqueKey(),
              ),
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
    return Card(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatroomScreen()),
          );
        },
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://m.media-amazon.com/images/M/MV5BMTk3NTc2NTI0N15BMl5BanBnXkFtZTgwMDA4MjcwNzM@._V1_SX300.jpg'),
          ),
          title: Text("Imane"),
          subtitle: Text("Une semaine!!"),
          trailing: Text("2020"),
        ),
      ),
    );
//    return Stack(
//      children: <Widget>[
//        GestureDetector(

//          },
//          child: Container(
//          height: SizeConfig.safeBlockVertical * 10,
//          width: SizeConfig.screenWidth,
//          color: Colors.white,
//            child: Row(
//              children: <Widget>[
//                Container(
//                    height: SizeConfig.safeBlockVertical * 10,
//                    width: SizeConfig.safeBlockVertical * 10,
//                    child: Icon(
//                      Icons.person,
//                    )),
//                Column(
//                  children: <Widget>[
//                    Container(
//                      child: Text(
//                        "Imane",
//                        style: TextStyle(fontSize: 24),
//                      ),
//                    ),
//                    Container(
//                      child: Text("Aloha"),
//                    ),
//                  ],
//                ),
//              ],
//            ),
//      ),
//        ),
//        Positioned(
//          left: SizeConfig.safeBlockHorizontal*80,
//          height: SizeConfig.safeBlockHorizontal*15,
//          width: SizeConfig.safeBlockVertical*10,
//          child: Container(
//            child: Center(child: Text("12:00")),  //to connect to the backend for time
//          ),
//        ),
//    ],
//    );
  }
}
