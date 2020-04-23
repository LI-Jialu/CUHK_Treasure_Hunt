import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:cuhk_treasure_hunt/widgets/long_item_card_Transaction_History.dart';
import 'package:cuhk_treasure_hunt/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class TransactionHistoryScreen extends StatefulWidget {
  var historyList1;
  var historyList2;
  TransactionHistoryScreen({this.historyList1, this.historyList2});

  @override
  _TransactionHistoryScreenState createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
    PageController _pageController;
    @override
    void initState() {
      super.initState();
      _pageController = PageController();
    }
    @override
    void dispose() {
      _pageController.dispose();
      super.dispose();
    }
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
          home: Scaffold(
            body: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                TransactionListView(index: 1,historyList: widget.historyList1),
                TransactionListView(index: 2,historyList: widget.historyList2),
              ],
            )
          )
      );
    }
}





