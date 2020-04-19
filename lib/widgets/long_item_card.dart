import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/screens/chatroom_screen.dart';

class LongItemCard extends StatefulWidget {
  String price;
  String name;
  LongItemCard({this.name,this.price});


  @override
  _LongItemCardState createState() => _LongItemCardState();
}

class _LongItemCardState extends State<LongItemCard> {

  bool isFavorite = false;  //to implement the backend to check if its favorite

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.safeBlockVertical * 15,
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 2,
          vertical: SizeConfig.safeBlockVertical * 1),
      child: Row(
        children: <Widget>[
          Container(
            height: SizeConfig.safeBlockVertical * 13,
            width: SizeConfig.safeBlockHorizontal * 20,
            color: Colors.amber,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(widget.name),
                  ),
                  Container(
                    child: Text(widget.price),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: SizeConfig.safeBlockHorizontal * 20,
            child: Column(
              children: <Widget>[
                Container(
                    height: SizeConfig.safeBlockVertical * 3,
                    width: SizeConfig.safeBlockVertical * 3,
                    child: GestureDetector(
                      onTap: () {
                        //TODO link the database to resume or start the chat
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatroomScreen()),
                        );
                      },
                      child: Icon(
                        Icons.chat,
                        color: Colors.teal,
                      ),
                    )),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 3,
                ),
                Container(
                  height: SizeConfig.safeBlockVertical * 3,
                  width: SizeConfig.safeBlockVertical * 3,
                  child: GestureDetector(
                    onTap: () {
                      isFavorite = !isFavorite;
                      setState(() {});
                    },
                    child: isFavorite
                        ? Icon(
                      Icons.favorite,
                      color: Colors.pinkAccent,
                    )
                        : Icon(
                      Icons.favorite_border,
                      color: Colors.pinkAccent,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
