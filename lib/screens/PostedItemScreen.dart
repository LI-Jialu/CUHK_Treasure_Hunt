/*
 Module for posted item page and composed of LongItemCardPostedItems module

 Module Name: PostedItemsScreen
 Programmer: Tang Yiu Kai
 Version: 1.0(10 May 2020)

 */

import 'package:cuhk_treasure_hunt/widgets/LongItemCardPostedItems.dart';
import 'package:flutter/material.dart';

class PostedItemsScreen extends StatefulWidget {
  final itemList;
  PostedItemsScreen({this.itemList});
  @override
  _PostedItemsScreenState createState() =>
      _PostedItemsScreenState();
}

class _PostedItemsScreenState extends State<PostedItemsScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.itemList.length != 0) {
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
                  image: widget.itemList[index]['image'],
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