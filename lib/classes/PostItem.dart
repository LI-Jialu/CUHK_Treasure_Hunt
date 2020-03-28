// define PostItem class

import 'package:cuhk_treasure_hunt/classes/ItemVerification.dart';

import 'Item.dart';
import 'User.dart';

class PostItem {

  // methods
  static void postItem(User user,String name, String posterID, double price, int quantity, List<String> tags){

    Item newItem = Item(name: name, posterID: posterID, price: price, quantity: quantity,
      tags: tags, postDate: DateTime.now());

    bool verified = ItemVerification.verifyItem(newItem);

    if (verified){

      // add to database
      // get itemID from database and save to newItem.itemID

    }
    else {

      // failure message

    }

  }

}