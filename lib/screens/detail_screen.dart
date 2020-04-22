
import 'dart:async';

import 'package:cuhk_treasure_hunt/classes/Item.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import '../utilities/constants.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:cuhk_treasure_hunt/database/database.dart';

class DetailScreen extends StatefulWidget {
  final Item item;
  final Map<String, dynamic> userinfo;
  DetailScreen({Key key, this.item, this.userinfo}) : super(key: key);
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

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
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
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
                      Container(color: Colors.pink),
                      Container(color: Colors.purple),
                    ],
                  ),
                ),
                Container(
                  height: SizeConfig.safeBlockVertical*5,
                  padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*5, right: SizeConfig.safeBlockHorizontal*5),
                  alignment: Alignment.bottomLeft,
                  child: Text(widget.item.name, style: kmiddle_black_textstyle),
                ),
                Container(
                  height: SizeConfig.safeBlockVertical*5,
                  padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*5, right: SizeConfig.safeBlockHorizontal*5),
                  alignment: Alignment.topLeft,
                  child: Text("\$" + widget.item.price, style: kmiddle_red_textstyle),
                ),
                Container(
                  height: SizeConfig.safeBlockVertical*10,
                  padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*5, right: SizeConfig.safeBlockHorizontal*5),
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: SizeConfig.safeBlockVertical*8,
                        width: SizeConfig.safeBlockVertical*8,
                        child: CircleAvatar(
                          radius: SizeConfig.safeBlockVertical*8,
                          backgroundImage:
                          Image.network(Item.imagePath+"IMAG09752020-04-21-22:55:52.jpg", height: SizeConfig.safeBlockVertical * 8).image,
                        ),
                      ),
                      Container(
                        padding:EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*3, right: SizeConfig.safeBlockHorizontal*5),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: SizeConfig.safeBlockVertical*5,
                              alignment: Alignment.bottomLeft,
                              child: Text(widget.item.poster_id, style: kmiddle_black_textstyle),
                            ),
                            Container(
                              height: SizeConfig.safeBlockVertical*5,
                              alignment: Alignment.topLeft,
                              child: Text("Unknown College", style: ksmall_black_textstyle),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: SizeConfig.safeBlockVertical*10,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Item.tags.length,
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
                              child: Center(child: Text(Item.tags[index], style: ksmall_black_textstyle),),
                            ),
                          ),
                        ],
                      );
                    }
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*5, right: SizeConfig.safeBlockHorizontal*5),
                  height: SizeConfig.safeBlockVertical*5,
                  alignment: Alignment.centerLeft,
                  child: Text('More descriptions', style: ksmall_black_textstyle),
                ),
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
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5),
                  ),
                  height: SizeConfig.safeBlockVertical*5,
                  width: SizeConfig.safeBlockHorizontal*40,
                  child: Center(
                    child: Text('Like', style: ksmall_black_textstyle,),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5),
                  ),
                  height: SizeConfig.safeBlockVertical*5,
                  width: SizeConfig.safeBlockHorizontal*40,
                  child: Center(
                    child: Text('Contact', style: ksmall_black_textstyle,),
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