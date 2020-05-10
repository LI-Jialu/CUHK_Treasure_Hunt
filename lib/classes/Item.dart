/*
Module to define Item class

Module Name: Item
Programmer: Hon Tik TSE, Chenyu HAN
Version: 1.0 (10 May 2020)

Contains fields and constructors related to items.
*/

class Item{

  // fields

  // image path of the images in the server
  static String imagePath = "http://ec2-3-80-187-207.compute-1.amazonaws.com/data/images/";
  // list of all tags
  static List<String> tags = ['free','other','stationery','clothing','book',
    'electric appliance','food','daily use','medical use','cosmetics'];

  // instance fields
  List<String> taglist = [];
  String item_id = "-1";
  String poster_id = "1";
  String name = "default_name";
  String price = "-1";
  String quantity = "-1";
  String create_time = "-1";
  String image = imagePath + "noImageUploaded.png";
  String description = "";
  String reputation = "0";

  // Constructor
  Item(this.name);

  // decode json encoded item array received from server to an Item object.
  Item.fromJson(Map<String, dynamic> json) {
    item_id = json["item_id"];
    poster_id = json["poster_id"];
    name = json["name"];
    price = json["price"];
    quantity = json["quantity"];
    create_time = json["create_time"];
    image = imagePath + json["image"];
    description = json["description"];
    reputation = json["reputation"];
  }


}