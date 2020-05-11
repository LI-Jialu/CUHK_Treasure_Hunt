/*
Module to define the widget for showing all transactions in progress

Module Name: TransactionScreen
Programmer: Hon Tik TSE
Version: 1.0 (10 May 2020)

Accessed from profile screen (HomescreenProfile).
*/

import 'package:cuhk_treasure_hunt/screens/ManageTransactionScreen.dart';
import 'package:cuhk_treasure_hunt/widgets/LongItemCardTransaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget{

  final transactionS; // transactions where the user logged in is the seller
  final transactionB; // transactions where the user logged in is the buyer

  // constructor
  TransactionScreen({this.transactionS,this.transactionB});

  @override
  TransactionScreenState createState() {
    return TransactionScreenState();
  }

}

class TransactionScreenState extends State<TransactionScreen>{

  int index = 0; // index 0: show transactions where user logged in is seller; index 1: buyer

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transactions"),),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                OutlineButton( // button for changing index to 0
                    color: Colors.amber,
                    textColor: Colors.black,
                    disabledTextColor: Colors.grey,
                    padding: EdgeInsets.all(8.0),
                    borderSide: BorderSide(color: Colors.grey, width: 0.5),
                    onPressed: index == 0? null:() {
                      setState(() {
                        index = 0;
                      });
                    },
                    child: Text("Sell")),
                OutlineButton( // button for changing index to 1
                    color: Colors.amber,
                    textColor: Colors.black,
                    disabledTextColor: Colors.grey,
                    padding: EdgeInsets.all(8.0),
                    borderSide: BorderSide(color: Colors.grey, width: 0.5),
                    onPressed: index == 0? () {
                      setState(() {
                        index = 1;
                      });
                    }:null,
                    child: Text("Buy")
                ),
              ],
            ),
            Divider(),
            IndexedStack(
              index: index,
              children: <Widget>[
                ListView.builder( // show each sell transaction of all transactions in progress
                  itemCount: widget.transactionS.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context,int i){
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      child: LongItemCardTransaction(
                        transactionItem: widget.transactionS[i],
                        isSell: true,
                      ),
                      onTap: ()async{ // go to ManageTransactionScreen when tapped
                        bool result = await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ManageTransactionScreen(
                            transactionItem: widget.transactionS[i],
                            isSell: true,
                            )
                          )
                        );
                        if (result == null){
                          result = false;
                        }
                        if (result){
                          Navigator.pop(context);
                        }
                      },
                    );
                  },
                ),
                ListView.builder( // show each buy transaction of all transactions in progress
                  itemCount: widget.transactionB.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context,int i){
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      child: LongItemCardTransaction(
                        transactionItem: widget.transactionB[i],
                        isSell: false,
                      ),
                      onTap: ()async { // go to ManageTransactionScreen when tapped
                        bool result = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ManageTransactionScreen(
                              transactionItem: widget.transactionB[i],
                              isSell: false,
                            )
                            )
                        );
                        if (result){
                          Navigator.pop(context);
                        }
                      },
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}