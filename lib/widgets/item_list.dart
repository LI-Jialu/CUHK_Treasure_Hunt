/*
Item List Module

Module Name: Item List
Programmer: Hon Tik TSE, Chenyu HAN, Zizhou TANG
Version: 1.0 (10 May 2020)

This Module includes 2 widgets, the ItemListView and ItemGridView.
ItemGridView is the widget to show a square card of item
ItemListView is the list of ItemGridView
*/

import 'package:cuhk_treasure_hunt/classes/Item.dart';
import 'package:cuhk_treasure_hunt/screens/detail_screen.dart';
import 'package:cuhk_treasure_hunt/screens/search_screen.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'package:http/http.dart';

// ItemGridView Class
class ItemGridView extends StatefulWidget {
  final Item item;
  Set<String> tagset = new Set();
  Future<List<Response>> _posterandtags;
  Future<List<Response>> getPosterAndTags() async {
    print("try getting poster and tags info!");
    Response posterinfo;
    posterinfo = await Database.get("/data/checkProfile.php?check_id=" + item.poster_id, "");
    print(posterinfo.body);
    Response tagsinfo;
    tagsinfo = await Database.get("/data/tags.php?item_id=" + item.item_id, "");
    //print(tagsinfo.body);
    return <Response>[posterinfo, tagsinfo];
  }
  ItemGridView(this.item) {
    _posterandtags = getPosterAndTags();
  }
  @override
  _ItemGridViewState createState() => _ItemGridViewState();
}

// state of ItemGridView
class _ItemGridViewState extends State<ItemGridView> {
  
  bool isFavorite = false;

  // function of add favourites, for the add favourite botton
  void addFavourites(String item_id)async{
    try{
      await Database.post('/data/manageFavourites.php', {"action":"insert","item_id": item_id,"favourite_id":"0"});
    }
    catch(e){
      print("fail to add to favourites");
    }
  }

  //determine if the item is favored or not
  
  @override
  Widget build(BuildContext context) {
    
    SizeConfig().init(context);

    // college information needs to be retrived from backend server, which requires time
    return FutureBuilder<List<Response>>(
      future: widget._posterandtags,
      builder: (BuildContext context, AsyncSnapshot<List<Response>> snapshot) {
        String college = "Loading...";
        // if college information has been retrived, the card can be tapped.
        if (snapshot.hasData) {
          var resultlist = json.decode(snapshot.data[0].body);
          var taglist = json.decode(snapshot.data[1].body);
          widget.tagset = new Set();
          taglist.forEach((tag) {
            widget.tagset.add(tag);
          });
          
          college = resultlist[0]["college"];
          return GestureDetector(
          child: Column(
            children: <Widget>[
              Container(

              height: SizeConfig.safeBlockVertical * 28,
              width: SizeConfig.safeBlockHorizontal * 40,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.all(Radius.circular(20)),
                      ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.all(Radius.circular(20)),
                          ),
                          child: FittedBox(
                            fit: BoxFit.cover,
                              child: Image.network(widget.item.image)),
                          height: SizeConfig.safeBlockVertical * 20,
                          width: SizeConfig.safeBlockHorizontal * 40,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal*5),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Text(widget.item.name),
                                height: SizeConfig.safeBlockVertical * 2,
                              ),
                              Container(
                                child: Text("\$" + widget.item.price, style: ksmall_red_textstyle),
                                height: SizeConfig.safeBlockVertical * 2,
                              ),
                              Container(
                                child: Text(college),
                                height: SizeConfig.safeBlockVertical * 2,
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  Positioned(
                    right: SizeConfig.safeBlockHorizontal * 3,
                    top: SizeConfig.safeBlockVertical * 22,
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                          if (isFavorite) {
                            addFavourites(widget.item.item_id);
                          }
                        },
                        child: isFavorite
                            ? Icon(
                                Icons.favorite,
                                color: Colors.pink,
                              )
                            : Icon(
                                Icons.favorite_border,
                                color: Colors.pink,
                              )),
                  ),
                ],
              ),
            ),
              SizedBox(height: SizeConfig.safeBlockVertical*2,),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailScreen(item: widget.item, userinfo: resultlist[0], tagset: widget.tagset)),
            );
          });
        }
        else {
          return Container(
          height: SizeConfig.safeBlockVertical * 28,
          width: SizeConfig.safeBlockHorizontal * 40,
          child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.all(Radius.circular(20)),
                      ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.all(Radius.circular(20)),
                          ),
                          child: FittedBox(
                            fit: BoxFit.cover,
                              child: Image.network(widget.item.image)),
                          height: SizeConfig.safeBlockVertical * 20,
                          width: SizeConfig.safeBlockHorizontal * 40,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal*5),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Text(widget.item.name),
                                height: SizeConfig.safeBlockVertical * 2,
                              ),
                              Container(
                                child: Text("\$" + widget.item.price, style: ksmall_red_textstyle),
                                height: SizeConfig.safeBlockVertical * 2,
                              ),
                              Container(
                                child: Text(college),
                                height: SizeConfig.safeBlockVertical * 2,
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  Positioned(
                    right: SizeConfig.safeBlockHorizontal * 3,
                    top: SizeConfig.safeBlockVertical * 22,
                    child: GestureDetector(
                        onTap: () {
                          isFavorite = !isFavorite;
                          setState(() {});
                        },
                        child: isFavorite
                            ? Icon(
                                Icons.favorite,
                                color: Colors.pink,
                              )
                            : Icon(
                                Icons.favorite_border,
                                color: Colors.pink,
                              )),
                  ),
                ],
              ),
        );
        }
      }
    );
  }
}

// To return a widget that scrolls down the page to view the items
class ItemListView extends StatelessWidget {
  final List<Item> itemlist;
  List<ItemGridView> itemGridList;
  ItemListView(this.itemlist){
    itemGridList = [];
    itemlist.forEach((item) {
      itemGridList.add(ItemGridView(item));
    });
  }
  @override
  Widget build(BuildContext context) {
    return _itemListView(context);
  }

  Widget _itemListView(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: (itemlist.length ~/ 2 + itemlist.length % 2) + (itemGridList.isEmpty? 1 : 0),
        itemBuilder: (context, index) {
          if (itemGridList.isEmpty) {
            return Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Sorry! No results found!'),
                ),
                height: SizeConfig.safeBlockVertical * 10,
              );
          }
          List<Widget> children = [
            itemGridList[index * 2],
            SizedBox(
              width: SizeConfig.safeBlockHorizontal * 5,
            ),
          ];
          if (index + 1 <= itemlist.length ~/ 2) {
            children.add(
              itemGridList[index * 2 + 1],
            );
          }
          else {
            children.add(
              SizedBox(
                width: SizeConfig.safeBlockHorizontal * 40,
              )
            );
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          );
        });
  }
}
