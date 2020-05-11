/*
Module to define the widget for showing posted item details, selecting buyers and creating transactions.

Module Name:
Programmer: Hon Tik TSE
Version: 1.0 (10 May 2020)

Accessed when a transaction item in TransactionScreen is tapped.
For managing transactions.
Options: Complete, Delete
*/

import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManageTransactionScreen extends StatefulWidget{

  final transactionItem; // transaction item managed
  final isSell; // true if user logged in is seller

  ManageTransactionScreen({this.transactionItem,this.isSell});

  @override
  ManageTransactionScreenState  createState() {
    return ManageTransactionScreenState();
  }
}

class ManageTransactionScreenState extends State<ManageTransactionScreen>{

  String rating = ""; // rating of the other user involved in this transaction
  bool canComplete = true; // whether the user can complete transaction
  // (user can only complete if user has never completed before.

  // methods
  Future<bool> completeTransaction()async{
    bool result = await Database.post(
        "/data/manageTransactions.php",
        {
          "action":"update",
          "rating":"$rating",
          "type" : "${widget.isSell?'s':'b'}",
          'transaction_id':'${widget.transactionItem['transaction_id']}'
        }
    );
    return result;
  }

  Future<bool> cancelTransaction()async{
    bool result = await Database.post(
        "/data/manageTransactions.php",
        {
          "action":"delete",
          "rating":"$rating",
          "type" : "${widget.isSell?'s':'b'}",
          'transaction_id':'${widget.transactionItem['transaction_id']}'
        }
    );
    return result;
  }

  Future<bool> showMessageDialog(String type, bool result)async{
    await showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
              title: Text("$type Transaction"),
              content: Text("${result?"Success":"Fail"}")
          );
        }
    );
    return true;
  }

  // build widget
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    print(widget.transactionItem);
    EdgeInsets padding = EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*5, right: SizeConfig.safeBlockHorizontal*5);

    // status is 1 if user has completed transaction before.
    // user can only complete transaction once.
    if (widget.isSell){
      if (widget.transactionItem['status_s'] == '1'){
        canComplete = false;
      }
    }
    else {
      if (widget.transactionItem['status_b'] == '1'){
        canComplete = false;
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text("Manage Transaction"),),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*2, right: SizeConfig.safeBlockHorizontal*2),
          child: ListView(
            children: <Widget>[
              Container( // image of item
                height: SizeConfig.safeBlockVertical*50,
                width: SizeConfig.safeBlockHorizontal*100,
                child:
                Image.network(Database.hostname+"/data/images/"+widget.transactionItem['image'], height: SizeConfig.safeBlockVertical * 50, width: SizeConfig.safeBlockVertical * 100),
              ),
              Container( // name of item
                height: SizeConfig.safeBlockVertical*5,
                padding: padding,
                alignment: Alignment.bottomLeft,
                child: Text(widget.transactionItem['name'], style: kmiddle_black_textstyle),
              ),
              Container( // price of item
                height: SizeConfig.safeBlockVertical*5,
                padding: padding,
                alignment: Alignment.bottomLeft,
                child: Text("\$" + widget.transactionItem['price'], style: kmiddle_red_textstyle),
              ),
              Container( // quantity of item
                height: SizeConfig.safeBlockVertical*5,
                padding: padding,
                alignment: Alignment.bottomLeft,
                child: Text("Quantity: ${widget.transactionItem['quantity']}", style: kmiddle_black_textstyle),
              ),
              Divider(),
              Row( // seller of item
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    padding: padding,
                    height: SizeConfig.safeBlockVertical*5,
                    alignment: Alignment.centerLeft,
                    child: Text('Seller: ${widget.transactionItem['seller']}', style: ksmall_black_textstyle),
                  ),
                  Container( // status of seller (whether seller has completed transaction)
                    padding: padding,
                    height: SizeConfig.safeBlockVertical*5,
                    alignment: Alignment.centerLeft,
                    child: Text('Status: ${widget.transactionItem['status_s']=='1'?"Complete":"Pending"}',
                        style: ksmall_black_textstyle),
                  ),
                ],
              ),
              Row( // buyer of item
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    padding: padding,
                    height: SizeConfig.safeBlockVertical*5,
                    alignment: Alignment.centerLeft,
                    child: Text('Buyer: ${widget.transactionItem['buyer']}', style: ksmall_black_textstyle),
                  ),
                  Container( // status of buyer
                    padding: padding,
                    height: SizeConfig.safeBlockVertical*5,
                    alignment: Alignment.centerLeft,
                    child: Text('Status: ${widget.transactionItem['status_b']=='1'?"Complete":"Pending"}',
                        style: ksmall_black_textstyle),
                  ),
                ],
              ),
              Row( // rating
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    height: SizeConfig.safeBlockVertical * 5,
                    alignment: Alignment.bottomLeft,
                    child: Text('Rating', style: ksmall_black_textstyle),
                  ),
                  Container(
                    height: SizeConfig.safeBlockVertical * 5,
                    width: SizeConfig.safeBlockHorizontal * 50,
                    child: TextField( // for entering the rating of the other user involved in this transaction
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      maxLines: 1,
                      decoration: InputDecoration(hintText: 'Rating out of 5'),
                      onChanged: (value) {
                        setState(() {
                          rating = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Divider(height: SizeConfig.safeBlockVertical*5,),
              FlatButton( // complete transaction button
                color: Colors.amber,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: rating != "" && canComplete? () async {
                  bool result = await completeTransaction();
                  result = await showMessageDialog("Complete", result);
                  Navigator.pop(context,true);
                }:null,
                child: Text(
                  "Complete Transaction",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Divider(),
              FlatButton( // cancel transaction button
                color: Colors.amber,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () async {
                  bool result = await cancelTransaction();
                  result = await showMessageDialog("Cancel", result);
                  Navigator.pop(context,true);
                },
                child: Text(
                  "Cancel Transaction",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}