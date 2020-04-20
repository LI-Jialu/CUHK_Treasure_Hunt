import 'package:cuhk_treasure_hunt/screens/detail_screen.dart';
import 'package:cuhk_treasure_hunt/screens/search_screen.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:cuhk_treasure_hunt/database/Database.dart';

class ItemGridView extends StatefulWidget {
  @override
  _ItemGridViewState createState() => _ItemGridViewState();
}

class _ItemGridViewState extends State<ItemGridView> {
  @override

  //determine if the item is favored or not
  bool isFavorite = false;

  Widget build(BuildContext context) {
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
                    color: Colors.amber,
                    height: SizeConfig.safeBlockVertical * 20,
                    width: SizeConfig.safeBlockHorizontal * 40,
                  ),
                  Container(
                    child: Text("Title"),
                    height: SizeConfig.safeBlockVertical * 2,
                  ),
                  Container(
                    child: Text("Price"),
                    height: SizeConfig.safeBlockVertical * 2,
                  ),
                  Container(
                    child: Text("New Asia"),
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
            MaterialPageRoute(builder: (context) => DetailScreen()),
          );
        });
  }
}

// To return a widget that scrolls down the page to view the items
class ItemListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _itemListView(context);
  }

  Widget _itemListView(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ItemGridView(),
              SizedBox(
                width: SizeConfig.safeBlockHorizontal * 10,
              ),
              ItemGridView(),
            ],
          );
        });
  }
}
