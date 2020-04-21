// define PostItem class

import 'dart:async';
import 'dart:convert';
//import 'dart:html' as html;
import "package:universal_html/prefer_sdk/html.dart" as html;
import 'dart:typed_data';
import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'User.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class PostItem {

  // methods
  static void postItem(User user,String name, String posterID, double price, int quantity, List<String> tags){



  }

  static String uploadImage(File imageFile){
    print("start uploading");
    print (imageFile == null);
    var basename = imageFile.path.split('/').last;
    http.post(Database.hostname+"/data/uploadImage.php",body:{
      "image":base64Encode(imageFile.readAsBytesSync()),
      "name": basename
    }).then((value){
      if (value.statusCode == 200) {
        print(value.body);
        print("image uploaded");
        return basename;
      }
      return "";
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

  static String uploadImageWeb(){

    html.InputElement uploadInput = html.FileUploadInputElement();
    List<dynamic> image;
    uploadInput.click();
    uploadInput.onChange.listen((e) {
      var files = uploadInput.files;
      if (files.length == 1) {
        var reader = html.FileReader();
        reader.readAsArrayBuffer(files[0]);
        reader.onLoadEnd.listen((event) {
           print("triggered");
           image = [files[0].name, reader.result];
           print(files[0].name);
           print(reader.result);
           uploadWeb(files[0].name, reader.result);
        });
        return files[0].name;
      }
      else {
        print("more than 1 image selected.");
        return "";
      }

    });
  }

  static void uploadWeb(String name, Uint8List bytes){
    try
    {

      http.post(Database.hostname+"/data/uploadImage.php",body:{
        "image":base64Encode(bytes),
        "name": name
      }).then((value){
        if (value.statusCode == 200) {
          print(value.body);
          print("image uploaded");
        }
      });
    }
    catch(e){
      print(bytes == null);
      print("Failure");
    }
  }


}