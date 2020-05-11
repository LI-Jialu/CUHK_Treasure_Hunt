/*
 Module for transaction history page,
 there is two pages, scroll horizontally, and composed of TransactionListView module

 Module Name: TransactionHistoryScreen
 Programmer: Tang Yiu Kai
 Version: 1.0(10 May 2020)

 */


import 'package:cuhk_treasure_hunt/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class TransactionHistoryScreen extends StatefulWidget {
  final historyList1;
  final historyList2;
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
      return Scaffold(
            body: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                TransactionListView(index: 1,historyList: widget.historyList1),
                TransactionListView(index: 2,historyList: widget.historyList2),
              ],
            )
      );
    }
}





