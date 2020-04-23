import 'dart:convert';

import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'package:cuhk_treasure_hunt/screens/PostedItemDetailScreen.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/screens/chatroom_screen.dart';
import 'package:http/http.dart';

class LongItemCardPostedItems extends StatefulWidget {
  var item;
  String itemID;
  String itemPosterID;
  String itemName;
  String itemPrice;
  String itemPostTime;
  String image;
  LongItemCardPostedItems({this.item,this.itemID, this.itemPosterID, this.itemName, this.itemPrice, this.itemPostTime, this.image});
  @override
  _LongItemCardPostedItemsState createState() => _LongItemCardPostedItemsState();
}

class _LongItemCardPostedItemsState extends State<LongItemCardPostedItems> {
  
  Future<Response> getBuyers(String item_id)async{
    
    Response res = await Database.get("/data/checkBuyers.php","?item_id=$item_id");
    return res;
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.safeBlockVertical * 15,
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 2,
          vertical: SizeConfig.safeBlockVertical * 1),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
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
                      child: Text(widget.itemName),
                    ),
                    Container(
                      child: Text(widget.itemPrice),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 13,
              width: SizeConfig.safeBlockHorizontal * 20,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  child: Center(
                    child: Text(widget.itemPostTime),
                  ),
                ),
              ),
            ),
          ],
        ),
        onTap: ()async{

          var buyers;
          try {
            Response response = await getBuyers(widget.item['item_id']);

            if (response.body!=null)
            {
              print("the body is not null");

              buyers = json.decode(response.body);
              print(json.decode(response.body),);
              print("decode complete");
            }
            else
              print("the body is null");

          } on Exception catch (e) {
              print("fail to acquire buyers");
          }

          // push
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context)=>PostedItemDetailScreen(item: widget.item,buyers: buyers,)
            )
          );
        },
      ),
    );
  }
}