import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:cuhk_treasure_hunt/widgets/long_item_card_Posted_Items.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class PostedItemsScreen extends StatefulWidget {
  var itemList;
  PostedItemsScreen({this.itemList});
  @override
  _PostedItemsScreenState createState() =>
      _PostedItemsScreenState();
}

class _PostedItemsScreenState extends State<PostedItemsScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.itemList.length != 0) {
      print("Successfully passed the favorite data");
      print(widget.itemList);
      return Scaffold(
        appBar: AppBar(title: Text('Posted Items'),),
        body: SafeArea(
          child: ListView.builder(
              itemCount: widget.itemList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return LongItemCardPostedItems(
                  item: widget.itemList[index],
                  itemID: widget.itemList[index]['item_id'],
                  itemPosterID: widget.itemList[index]['poster_id'],
                  itemName: widget.itemList[index]['name'],
                  itemPrice: widget.itemList[index]['price'],
                  itemPostTime: widget.itemList[index]['create_time'],
                );
              }),
        ),
      );
    }
    else
    {
      print("No Posted Items");
      return Scaffold(
        appBar: AppBar(title: Text('Posted Items'),),
        body: SafeArea(
          child:Center(
            child: Container(
              child: Text("No Posted Items", ),
            ),
          ),
        ),
      );
    }
  }
}