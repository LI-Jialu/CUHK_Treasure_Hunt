// define PostItem class

import 'dart:convert';

import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'package:http/http.dart' as http;
import 'User.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class PostItem {

  // methods
  static void postItem(User user,String name, String posterID, double price, int quantity, List<String> tags){



  }

  static void uploadImage(File imageFile)async{

    var basename = imageFile.path.split('/').last;
    http.post(Database.hostname+"/data/uploadImage.php",body:{
      "image":base64Encode(imageFile.readAsBytesSync()),
      "name": basename
    }).then((value){
      if (value.statusCode == 200) {
        print(value.body);
        print("image uploaded");
      }
    });

  }

  static Future<File> pickImage()async {

    try {
      var file = await ImagePicker.pickImage(source: ImageSource.gallery);
      return file;
    }
    catch(e){
      print("fail to select image");
      return null;
    }
  }

}