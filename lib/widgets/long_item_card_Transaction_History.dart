import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/screens/chatroom_screen.dart';

class LongItemCardTransactionHistory extends StatefulWidget {
  @override
  _LongItemCardTransactionHistoryState createState() => _LongItemCardTransactionHistoryState();
}

class _LongItemCardTransactionHistoryState extends State<LongItemCardTransactionHistory> {

  bool isBuy = false;  //to implement the backend to check if it is buy or sell

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
                    child: Text("Item Name"),
                  ),
                  Container(
                    child: Text("Price"),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: SizeConfig.safeBlockVertical * 13,
            width: SizeConfig.safeBlockHorizontal * 15,
            child: GestureDetector(
              onTap: () {},
              child: isBuy
                  ? Container(
                  color: Colors.green,
                  child: Center(
                  child: Text(
                    "Buy",
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
                  : Container(
                  color: Colors.red,
                  child: Center(
                  child: Text(
                    "Sell",
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}