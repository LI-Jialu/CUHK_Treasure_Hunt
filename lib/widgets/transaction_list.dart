import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'long_item_card_Transaction_History.dart';




class TransactionListView extends StatefulWidget {
    int index;
    var historyList;
    TransactionListView({this.index, this.historyList});
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionListView> {
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
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('$name'),
        ),
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
                  image: widget.historyList[index]['image'],
                );
              }),
        ),
      );
    }
    else
    {
      print("the list is empty");
      return Scaffold(
        appBar: AppBar(title: Text('$name'),),
        body: SafeArea(
          child:Center(
            child: Container(
              child: Text("No $name", ),
            ),
          ),
        ),
      );
    }
  }
}
