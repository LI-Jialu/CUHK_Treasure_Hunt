import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/screens/chatroom_screen.dart';

class LongItemCardTransactionHistory extends StatefulWidget {
  int index;
  String price;
  String name;
  String time;
  String seller;
  String buyer;
  String image;
  LongItemCardTransactionHistory({this.index, this.price,this.name,this.time, this.seller, this.buyer, this.image});
  @override
  _LongItemCardTransactionHistoryState createState() => _LongItemCardTransactionHistoryState();
}

class _LongItemCardTransactionHistoryState extends State<LongItemCardTransactionHistory> {
  String showName;
  @override
  Widget build(BuildContext context) {
    if (widget.index==1)  {
      showName = "Seller: "+widget.seller;
    }else {
      showName = "Buyer: "+widget.buyer;
    }

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
                  Container(
                    child: Text("$showName"),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: SizeConfig.safeBlockVertical * 13,
            width: SizeConfig.safeBlockHorizontal * 15,
              child: Center(
                child: Text(widget.time),
              )
          ),
        ],
      ),
    );
  }
}