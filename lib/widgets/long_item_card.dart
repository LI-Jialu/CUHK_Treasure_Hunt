import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/screens/chatroom_screen.dart';
import 'package:cuhk_treasure_hunt/database/Database.dart';

class LongItemCard extends StatefulWidget {
  final String price;
  final String name;
  bool isFavorite = false;
  final String item_id;
  final String favourite_id;
  final String image;

  LongItemCard({this.name,this.price,this.favourite_id,this.item_id,this.isFavorite, this.image});

  @override
  _LongItemCardState createState() => _LongItemCardState();
}

class _LongItemCardState extends State<LongItemCard> {



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
            child: Image.network(Database.hostname+"/data/images/"+widget.image, height: SizeConfig.safeBlockVertical * 13,width: SizeConfig.safeBlockHorizontal * 20),
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
                    child: Text("\$"+widget.price),
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
                    onTap: () async {
                      widget.isFavorite = !widget.isFavorite;
                      if (widget.isFavorite==true)
                      {
                        try{
                          print(widget.item_id);
                          await Database.post("/data/manageFavourites.php",
                              {"action":"insert","item_id":"${widget.item_id}",
                                "favourite_id":"${widget.favourite_id}"});
                        }
                        catch(e){
                          print("fail to add to favourites");
                        }
                        //implement favorite management
                      }
                      else
                      {
                        try{
                          await Database.post("/data/manageFavourites.php",
                              {"action":"delete","item_id":"${widget.item_id}",
                                "favourite_id":"${widget.favourite_id}"});
                        }
                        catch(e){
                          print("fail to delete from the favorites");
                        }
                      }
                      setState(() {

                      });
                    },
                    child: widget.isFavorite
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
