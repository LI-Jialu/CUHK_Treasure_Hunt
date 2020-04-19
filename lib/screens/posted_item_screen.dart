import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:cuhk_treasure_hunt/widgets/long_item_card_Posted_Items.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class PostedItemsScreen extends StatefulWidget {
  @override
  _PostedItemsScreenState createState() =>
      _PostedItemsScreenState();
}

class _PostedItemsScreenState extends State<PostedItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posted Items'),),
      body: SafeArea(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index){
              return LongItemCardPostedItems();
            }),
      ),
    );
  }
}