import 'dart:convert';

import 'package:cuhk_treasure_hunt/classes/User.dart';
import 'package:cuhk_treasure_hunt/classes/UserVerification.dart';
import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'package:cuhk_treasure_hunt/screens/TransactionScreen.dart';
import 'package:cuhk_treasure_hunt/screens/home_screen.dart';
import 'package:cuhk_treasure_hunt/screens/posted_item_screen.dart';
import 'package:cuhk_treasure_hunt/screens/transaction_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:cuhk_treasure_hunt/classes/UserProfile.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

import 'favorite_screen.dart';

class LoadingScreen2 extends StatefulWidget {
  int index;
  LoadingScreen2({this.index});

  @override
  _LoadingScreen2State createState() => _LoadingScreen2State();
}

class _LoadingScreen2State extends State<LoadingScreen2> {
  @override

  Future<Response> get_items()async{
    var items;
    items =await Database.get("/data/itemsPosted.php", "");
    return items;
  }

  Future<Response> get_favotite()async{
    var favorites;
    favorites =await Database.get("/data/favourites.php", "");
    return favorites;
  }

  Future<Response> getBuyHistory()async{
    var history;
    history =await Database.get("/data/transactions.php", "?type=buy&status=1");
    return history;
  }

  Future<Response> getSellHistory()async{
    var history;
    history =await Database.get("/data/transactions.php", "?type=sell&status=1");
    return history;
  }

  Future<Response> getTransactionS()async{
    var response;
    response = await Database.get("/data/transactions.php", "?type=sell&status=0");
    return response;
  }

  Future<Response> getTransactionB()async{
    var response;
    response = await Database.get("/data/transactions.php", "?type=buy&status=0");
    return response;
  }

  void initState() {
    super.initState();
    goTo(widget.index);
  }
  void goTo(int index) async{
    switch(index) {

      case 1: {
        var item_list;
        try{
          Response items = await get_items();
          if (items.body!=null)
          {
            print("the body is not null");

            item_list = json.decode(items.body);
            print(json.decode(items.body),);
            print("decode complete");
          }
          else
            print("the body is null");
        }
        catch(e){
          print("fail to acquire the list");
        }
        //FavoriteScreen(favorite_list: favorite_list,)),
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder:
              (context) => PostedItemsScreen(itemList: item_list,)),
        );
      }
      break;

      case 2: {
        var favorite_list;
        try{
          Response favorites = await get_favotite();
          if (favorites.body!=null)
          {
            print("the body is not null");

            favorite_list = json.decode(favorites.body);
            print(json.decode(favorites.body),);
            print("decode complete");
          }
          else
            print("the body is null");
        }
        catch(e){
          print("fail to acquire the list");
        }
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder:
              (context) => FavoriteScreen(favorite_list: favorite_list,)),
        );
      }
      break;
      case 3: {
        var historyList1;
        try{
          Response buyHistory = await getBuyHistory();
          if (buyHistory.body!=null)
          {
            print("the body is not null");

            historyList1 = json.decode(buyHistory.body);
            print(historyList1);
            print("decode complete");
          }
          else
            print("the body is null");
        }
        catch(e){
          print("fail to acquire the list");
        }
        var historyList2;
        try{
          Response sellHistory = await getSellHistory();
          if (sellHistory.body!=null)
          {
            print("the body is not null");

            historyList2 = json.decode(sellHistory.body);
            print(historyList2);
            print("decode complete");
          }
          else
            print("the body is null");
        }
        catch(e){
          print("fail to acquire the list");
        }
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => TransactionHistoryScreen(historyList1: historyList1, historyList2: historyList2)),
        );
      }
      break;

      case 5: {
        var transactionB,transactionS;
        try{
          Response responseS = await getTransactionS();
          Response responseB = await getTransactionB();
          if (responseS.body!=null && responseB.body != null)
          {
            print("the body is not null");

            transactionB = json.decode(responseB.body);
            transactionS = json.decode(responseS.body);
            print(transactionS);
            print(transactionB);

            print("decode complete");
          }
          else
            print("the body is null");
        }
        catch(e){
          print("fail to acquire the list");
        }
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => TransactionScreen(
                transactionS: transactionS,
                transactionB: transactionB,
              )),
        );
      }
      break;

      default: {
      }
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: SizeConfig.safeBlockHorizontal*30,
          height: SizeConfig.safeBlockVertical*30,
          child: SpinKitWave(
            color: Colors.teal,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}