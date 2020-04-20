// Define Item class

import 'package:flutter/cupertino.dart';

class Item{

  String item_id;
  String poster_id;
  String name;
  String price;
  String quantity;
  String create_time;
  Item.fromJson(Map<String, dynamic> json) {
    item_id = json["item_id"];
    poster_id = json["poster_id"];
    name = json["name"];
    price = json["price"];
    quantity = json["quantity"];
    create_time = json["create_time"];
  }

  // methods
  void updateBuyers(String type, String ID){

  }


}