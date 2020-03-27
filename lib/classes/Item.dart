// Define Item class

import 'package:flutter/cupertino.dart';

class Item{

  // fields
  // fields are kept private to prevent other classes from modifying them directly
  String _name;
  String _itemID;
  String _posterID;
  List<String> _buyersID;
  double _price;
  int _quantity;
  List<String> _tags;
  DateTime _postDate;
  //photo

  // constructor
  Item({
    @required String name,
    @required String posterID,
    @required double price,
    @required int quantity,
    @required List<String> tags,
    @required DateTime postDate
  }) : _name = name, _posterID = posterID, _price = price, _quantity = quantity,
    _tags = tags, _postDate = postDate;

  // getters
  String get name => _name;
  String get posterID => _posterID;
  String get itemID => _itemID;
  List<String> get buyersID => _buyersID;
  double get price => _price;
  int get quantity => _quantity;
  List<String> get tags => _tags;
  DateTime get postDate => _postDate;

  // methods
  void updateBuyers(String type, String ID){
    if (type == "add"){
      _buyersID.add(ID);
    }
    if (type == "delete"){
      _buyersID.remove(ID);
    }

    // delete in database
  }

  // Item is only created in PostItem
  // createItem can be done using "new Item(...). No need to define here"
  // after createItem, item should be added to database. This can be done
  // in PostItem, directly following the creation of the item.

  // deleteItem works on the database, which is yet to be implemented
  // this can also be directly done in deletePostedItem() in User class.
  // No need to implement here.

  // other update methods will be added later.

}