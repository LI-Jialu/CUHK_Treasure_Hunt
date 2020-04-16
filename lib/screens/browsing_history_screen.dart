import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/widgets/long_item_card.dart';

class BrowsingHistoryScreen extends StatefulWidget {
  @override
  _BrowsingHistoryScreenState createState() => _BrowsingHistoryScreenState();
}

class _BrowsingHistoryScreenState extends State<BrowsingHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Browsing History'),),
      body: SafeArea(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
            itemBuilder: (context, index){
            return LongItemCard();
            }),
      ),
    );
  }
}
