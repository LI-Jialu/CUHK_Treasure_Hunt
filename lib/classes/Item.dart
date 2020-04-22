// Define Item class

import 'package:flutter/cupertino.dart';

class Item{

  static String imagePath = "http://ec2-3-80-187-207.compute-1.amazonaws.com/data/images/";

  String item_id = "-1";
  String poster_id = "-1";
  String name = "default_name";
  String price = "-1";
  String quantity = "-1";
  String create_time = "-1";
  Item(this.name);
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