/*
 Module for managing transaction history list in transaction history screen

 Module Name: LongItemCardTransactionHistory
 Programmer: Tang Yiu Kai
 Version: 1.0(10 May 2020)

 */


import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'package:cuhk_treasure_hunt/utilities/SizeConfig.dart';
import 'package:flutter/material.dart';

class LongItemCardTransactionHistory extends StatefulWidget {
  final int index;
  final String price;
  final String name;
  final String time;
  final String seller;
  final String buyer;
  final String image;

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