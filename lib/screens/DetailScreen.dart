/*
Item Detail Screen Module

Module Name: Detail Screen
Programmer: Hon Tik TSE, Chenyu HAN, Zizhou TANG
Version: 1.0 (10 May 2020)

The widget to show detail of item
*/

import 'dart:async';

import 'package:cuhk_treasure_hunt/classes/Item.dart';
import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'package:cuhk_treasure_hunt/screens/ChatroomScreen.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/utilities/SizeConfig.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import '../utilities/constants.dart';

// The screen widget class
class DetailScreen extends StatefulWidget {
  final Item item;
  final Map<String, dynamic> userinfo;
  final Set<String> tagset;
  DetailScreen({Key key, this.item, this.userinfo, this.tagset}) : super(key: key);
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

// The screen state
class _DetailScreenState extends State<DetailScreen> {
  PageController _controller = PageController(
    initialPage: 0,
    viewportFraction: 1,
  );
  /*
  Future<Response> _itemdetails;
  Future<Response> getItemDetails() async {
    print("try getting item ${widget.itemid} details");
    Response itemdetails;
    // backend to finish
    itemdetails = await Database.get("/data/", "");
  }
  */

  // Functions to communicate with backend
  // send buy item request to backend
  Future<bool> buyItem() async {
    bool result = await Database.post(
      "/data/manageBuyRequests.php",
      {"action":"insert", "item_id":"${widget.item.item_id}", "quantity":"1"}
    );
    return result;
  }

  // send add favourite request to backend
  void addFavourites(String item_id)async{
    try{
      await Database.post('/data/manageFavourites.php', {"action":"insert","item_id": item_id,"favourite_id":"0"});
    }
    catch(e){
      print("fail to add to favourites");
    }
  }

//  void cancelFavourites(String item_id)async{
//    try{
//      await Database.post('/data/manageFavourites.php', {"action":"delete","item_id":widget.item_id,
//        "favourite_id":widget.favourite_id});
//    }
//    catch(e){
//      print("fail to cancel favotite");
//    }
//  }
//  void isFavourites(String item_id)async{
//    try{
//      await Database.get('', query)
//    }catch(e){
//
//    }
//  }

  bool itemLiked = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override

  // widgetbuilder
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    List<String> taglist = widget.tagset.toList();
    return Scaffold(
      // screen title
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Column(
        children: <Widget>[
          // main body. info of item
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                // scrollable picture gallery (currently support only 1 picture)
                Container(
                  height: SizeConfig.safeBlockVertical*50,
                  width: SizeConfig.safeBlockHorizontal*100,
                  child: PageView(  
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        child: Image.network(widget.item.image, height: SizeConfig.safeBlockVertical * 50, width: SizeConfig.safeBlockVertical * 100),
                      ),
                    ],
                  ),
                ),
                // item name
                Container(
                  height: SizeConfig.safeBlockVertical*5,
                  padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*5, right: SizeConfig.safeBlockHorizontal*5),
                  alignment: Alignment.bottomLeft,
                  child: Text(widget.item.name, style: kmiddle_black_textstyle),
                ),
                // price of item
                Container(
                  height: SizeConfig.safeBlockVertical*5,
                  padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*5, right: SizeConfig.safeBlockHorizontal*5),
                  alignment: Alignment.topLeft,
                  child: Text("\$" + widget.item.price, style: kmiddle_red_textstyle),
                ),
                // item's poster's info
                Container(
                  height: SizeConfig.safeBlockVertical*10,
                  padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*5, right: SizeConfig.safeBlockHorizontal*5),
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      // poster's profile photo
                      Container(
                        height: SizeConfig.safeBlockVertical*8,
                        width: SizeConfig.safeBlockVertical*8,
                        child: CircleAvatar(
                          radius: SizeConfig.safeBlockVertical*8,
                          backgroundImage:
                          Image.network(Item.imagePath+"IMAG09752020-04-21-22:55:52.jpg", height: SizeConfig.safeBlockVertical * 8).image,
                        ),
                      ),
                      // poster's name and college
                      Container(
                        padding:EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*3, right: SizeConfig.safeBlockHorizontal*5),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: SizeConfig.safeBlockVertical*5,
                              alignment: Alignment.bottomLeft,
                              child: Text(widget.userinfo["username"], style: kmiddle_black_textstyle),
                            ),
                            Container(
                              height: SizeConfig.safeBlockVertical*5,
                              alignment: Alignment.topLeft,
                              child: Text(widget.userinfo["college"], style: ksmall_black_textstyle),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                    ],
                  ),
                ),
                // item's tags
                Container(
                  height: SizeConfig.safeBlockVertical*10,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: taglist.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children : <Widget>[
                          SizedBox(width:SizeConfig.safeBlockHorizontal*3),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 0.5),
                              ),
                              height: SizeConfig.safeBlockVertical*5,
                              padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*1, right: SizeConfig.safeBlockHorizontal*1),
                              child: Center(child: Text(taglist[index], style: ksmall_black_textstyle),),
                            ),
                          ),
                        ],
                      );
                    }
                  ),
                ),
                // "More descriptions"
                Container(
                  padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*5, right: SizeConfig.safeBlockHorizontal*5),
                  height: SizeConfig.safeBlockVertical*5,
                  alignment: Alignment.centerLeft,
                  child: Text('More descriptions', style: ksmall_black_textstyle),
                ),
                // detailed descriptions
                Container(
                  padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*5, right: SizeConfig.safeBlockHorizontal*5, bottom: SizeConfig.safeBlockHorizontal*5),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5),
                    ),
                    padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal*5),
                    child: Text(widget.item.description, style: ksmall_black_textstyle),
                  ),
                )
              ],
            ),
          ),
          // bottoms below
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical*1, bottom: SizeConfig.safeBlockVertical*1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // favourite bottom
                GestureDetector(
                  onTap: (){
                    if (itemLiked==true)
                      {

                      }
                    else
                      {
                        addFavourites(widget.item.item_id);
                      }
                    itemLiked = !itemLiked;

                    setState(() {
//                      print(widget.item.item_id);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5),
                      color: itemLiked?Colors.pinkAccent:Colors.white,
                    ),
                    height: SizeConfig.safeBlockVertical*5,
                    width: SizeConfig.safeBlockHorizontal*30,
                    child: Center(
                      child: Text('Like', style: itemLiked?TextStyle(color: Colors.white):ksmall_black_textstyle,),
                    ),
                  ),
                ),
                // contact bottom
                GestureDetector(
                  onTap:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatroomScreen(
                        contact_name:widget.userinfo['username'],
                        user_id: widget.userinfo['user_id'],)),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5),
                      color: Colors.teal,
                    ),
                    height: SizeConfig.safeBlockVertical*5,
                    width: SizeConfig.safeBlockHorizontal*30,
                    child: Center(
                      child: Text('Contact', style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ),
                // buy item bottom
                GestureDetector(
                  onTap: () async{
                    bool result = await buyItem();
                    if (result) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Buy"),
                            content: Text("Successfully send buy request!")
                          );
                        }
                      );
                    }
                    else{
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Buy"),
                            content: Text("Failed send buy request!")
                          );
                        }
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5),
                      color: Colors.amber,
                    ),
                    height: SizeConfig.safeBlockVertical*5,
                    width: SizeConfig.safeBlockHorizontal*30,
                    child: Center(
                      child: Text('Buy', style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}