import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:cuhk_treasure_hunt/widgets/long_item_card_Transaction_History.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class TransactionHistoryScreen extends StatefulWidget {
  int index;
  var historyList;
  TransactionHistoryScreen({this.index, this.historyList});

  @override
  _TransactionHistoryScreenState createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  String name;
  @override
  Widget build(BuildContext context) {
    if (widget.index == 1) {
      name = "Items Bought";
    }
    else {
      name = "Items Sold";
    }
    if (widget.historyList.length != 0) {
      return Scaffold(

        appBar: AppBar(title: Text('$name'),),
        body: SafeArea(
          child: ListView.builder(
              itemCount: widget.historyList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return LongItemCardTransactionHistory(
                  index: widget.index,
                  price: widget.historyList[index]['price'],
                  name: widget.historyList[index]['name'],
                  time: widget.historyList[index]['create_time'],
                  seller: widget.historyList[index]['seller'],
                  buyer: widget.historyList[index]['buyer'],
                );
              }),
        ),
      );
    }
    else
    {
      print("the list is empty");
      return Scaffold(
        appBar: AppBar(title: Text('Favorites'),),
        body: SafeArea(
          child:Center(
            child: Container(
              child: Text("No history", ),
            ),
          ),
        ),
      );
    }
  }
}