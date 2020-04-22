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

class ItemGridView extends StatefulWidget {
  final Item item;
  Future<Response> _posterinfo;
  Future<Response> getPosterInfo() async {
    print("try getting poster info!");
    Response posterinfo;
    posterinfo = await Database.get("/data/checkProfile.php?check_id=" + item.poster_id, "");
    print(posterinfo.body);
    return posterinfo;
  }
  ItemGridView(this.item) {
    _posterinfo = getPosterInfo();
  }
  @override
  _ItemGridViewState createState() => _ItemGridViewState();
}


class _ItemGridViewState extends State<ItemGridView> {
  
  bool isFavorite = false;

  //determine if the item is favored or not
  
  @override
  Widget build(BuildContext context) {
    
    SizeConfig().init(context);

    return FutureBuilder<Response>(
      future: widget._posterinfo,
      builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
        String college = "Loading...";
        if (snapshot.hasData) {
          var resultlist = json.decode(snapshot.data.body);
          college = resultlist[0]["college"];
          return GestureDetector(
          child: Container(
          height: SizeConfig.safeBlockVertical * 30,
          width: SizeConfig.safeBlockHorizontal * 40,
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Image.network(widget.item.image, width: SizeConfig.safeBlockHorizontal * 40, height: SizeConfig.safeBlockVertical * 20),
                    height: SizeConfig.safeBlockVertical * 20,
                    width: SizeConfig.safeBlockHorizontal * 40,
                  ),
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
        ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailScreen(item: widget.item, userinfo: resultlist[0])),
            );
          });
        }
        else {
          return Container(
          height: SizeConfig.safeBlockVertical * 30,
          width: SizeConfig.safeBlockHorizontal * 40,
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Image.network(widget.item.image, width: SizeConfig.safeBlockHorizontal * 40, height: SizeConfig.safeBlockVertical * 20),
                    height: SizeConfig.safeBlockVertical * 20,
                    width: SizeConfig.safeBlockHorizontal * 40,
                  ),
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
        itemCount: (itemlist.length ~/ 2 + itemlist.length % 2),
        itemBuilder: (context, index) {
          List<Widget> children = [
            itemGridList[index * 2],
            SizedBox(
              width: SizeConfig.safeBlockHorizontal * 10,
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
