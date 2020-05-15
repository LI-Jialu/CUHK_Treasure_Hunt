/*
  For showing a user's buy requests
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'package:cuhk_treasure_hunt/utilities/SizeConfig.dart';

class BuyRequestScreen extends StatefulWidget {

  final buyRequests;
  BuyRequestScreen({this.buyRequests});
  @override
  _BuyRequestScreenState createState() => _BuyRequestScreenState();
}

class _BuyRequestScreenState extends State<BuyRequestScreen> {

  Widget requestCard(int index){
    return Center(
      child: Card(
        child: ListTile(
          leading: Icon(Icons.watch_later),
          title: Text(widget.buyRequests[index]['name'] != null?widget.buyRequests[index]['name']:"Deleted by Poster"),
          subtitle: Text(widget.buyRequests[index]['price'] != null?widget.buyRequests[index]['price']:"Deleted",
      ),
          trailing: Text("Quantity: "+widget.buyRequests[index]['quantity']!=null?widget.buyRequests[index]['quantity']:
          "Deleted"),
        ),),
    );
//    return Container(
//      height: SizeConfig.safeBlockVertical * 13,
//      width: SizeConfig.screenWidth,
//      padding: EdgeInsets.symmetric(
//          horizontal: SizeConfig.safeBlockHorizontal * 2,
//          vertical: SizeConfig.safeBlockVertical * 1),
//      child: Row(
//        children: <Widget>[
//          Container(
//            height: SizeConfig.safeBlockVertical * 13,
//            width: SizeConfig.safeBlockHorizontal * 20,
////            child: Image.network(Database.hostname+"/data/images/"+widget.image, height: SizeConfig.safeBlockVertical * 13,width: SizeConfig.safeBlockHorizontal * 20),
//          ),
//          Column(
//            children: <Widget>[
//              Container(
//                child: Text(widget.buyRequests[index]['name']),
//              ),
//              Container(
//                child: Text(widget.buyRequests[index]['price']),
//              ),
//            ],
//          ),
//          Container(
//            child: Text(widget.buyRequests[index]['seller']),
//          ),
//          Container(
//            child: Text(widget.buyRequests[index]['quantity']),
//          ),
//        ],
//      ),
//    );
  }
  
  void deleteRequest(String item_id, String quantity)async{
    await Database.post('/data/manageBuyRequests.php', {"action":"delete","item_id":item_id,"quantity":quantity});
    print("process completed!");
  }

  Widget slideRightBackground() {
    return Container(
      color: Colors.green,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
            Text(
              " Edit",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }
  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buy Requests"),
      ),
      body: SafeArea(
        child: Container(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: widget.buyRequests.length,
              itemBuilder: (context, index){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Dismissible(
                      background: slideRightBackground(),
                      secondaryBackground: slideLeftBackground(),
                      onDismissed: (DismissDirection direction){
                        if (direction==DismissDirection.endToStart)
                        {
                          deleteRequest(widget.buyRequests[index]['item_id'], widget.buyRequests[index]['quantity']);
                        }
                        setState(() {
                          widget.buyRequests.delete(index);
                        });
                      },
                      child: Container(
                          width: SizeConfig.screenWidth,
                          padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal*2,vertical: SizeConfig.safeBlockVertical),
                          child: requestCard(index)),
                      key: UniqueKey(),
                    ),
                  ],
                );

              }),
        ),
      ),
    );
  }
}

