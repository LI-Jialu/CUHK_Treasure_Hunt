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
  var contact_list_result;
  var result;
  Future<Response> contact_list;

  void get_contact_list() {
    contact_list = Database.get('/data/contactList.php', '');
//    result = json.decode(contact_list.body);
//    print(contact_list.body);
  }

  @override
  void initState() {
    super.initState();
    get_contact_list();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: contact_list,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.hasData)
          {
            contact_list_result = snapshot.data;
            result = json.decode(contact_list_result.body);
            print(result);
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
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: result.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            Dismissible(
                              background: slideRightBackground(),
                              secondaryBackground: slideLeftBackground(),
                              onDismissed: (DismissDirection direction){
                                setState(() {
                                  //remove
                                  //TODO: delete the message from the database?
                                });
                              },
                              child: ContactCard(
                                name: result[index]["username"],
                                message: result[index]["message"],

                              ),
                              key: UniqueKey(),
                            ),
                          ],
                        );
                      }),
                ),
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
  Widget slideRightBackground() {
    return Container(
      color: Colors.green,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
            Text(
              " Edit",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }
  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

}




class ContactCard extends StatefulWidget {
  String name;
  String message;
  ContactCard({this.name, this.message});


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
          title: Text(widget.name),
          subtitle: Text(widget.message),
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
