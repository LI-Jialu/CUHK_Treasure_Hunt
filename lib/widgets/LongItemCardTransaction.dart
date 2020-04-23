import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:flutter/material.dart';


class LongItemCardTransaction extends StatefulWidget {

  var transactionItem;
  bool isSell;

  LongItemCardTransaction({this.transactionItem,this.isSell});
  @override
  _LongItemCardTransactionState createState() => _LongItemCardTransactionState();
}

class _LongItemCardTransactionState extends State<LongItemCardTransaction> {

  String showName;

  @override

  Widget build(BuildContext context) {
    showName = widget.isSell? "Buyer: ${widget.transactionItem['buyer']}":
        "Seller: ${widget.transactionItem['seller']}";

    return Container(
      height: SizeConfig.safeBlockVertical * 15,
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 2,
          vertical: SizeConfig.safeBlockVertical * 1),
      child: Row(
        children: <Widget>[
          Container(
            height: SizeConfig.safeBlockVertical * 13,
            width: SizeConfig.safeBlockHorizontal * 20,
            child: Image.network(Database.hostname+"/data/images/"+widget.transactionItem['image']),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(widget.transactionItem['name']),
                  ),
                  Container(
                    child: Text("\$"+widget.transactionItem['price']),
                  ),
                  Container(
                    child: Text("$showName"),
                  ),
                ],
              ),
            ),
          ),
          Container(
              height: SizeConfig.safeBlockVertical * 13,
              width: SizeConfig.safeBlockHorizontal * 15,
              child: Center(
                child: Text(widget.transactionItem['create_time']),
              )
          ),
        ],
      ),
    );
  }
}