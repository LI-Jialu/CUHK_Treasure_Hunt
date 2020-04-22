import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/screens/chatroom_screen.dart';

class LongItemCardPostedItems extends StatefulWidget {
  String itemID;
  String itemPosterID;
  String itemName;
  String itemPrice;
  String itemPostTime;
  LongItemCardPostedItems({this.itemID, this.itemPosterID, this.itemName, this.itemPrice, this.itemPostTime});
  @override
  _LongItemCardPostedItemsState createState() => _LongItemCardPostedItemsState();
}

class _LongItemCardPostedItemsState extends State<LongItemCardPostedItems> {
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
                    child: Text(widget.itemName),
                  ),
                  Container(
                    child: Text(widget.itemPrice),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: SizeConfig.safeBlockVertical * 13,
            width: SizeConfig.safeBlockHorizontal * 20,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                child: Center(
                  child: Text(widget.itemPostTime),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}