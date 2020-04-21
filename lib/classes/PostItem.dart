// define PostItem class

import 'dart:async';
import 'dart:convert';
//import 'dart:html' as html;
import 'package:intl/intl.dart';
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


  static void uploadImage(File imageFile)async{

    // upload image to server give a File.

    print("start uploading");
    print (imageFile == null);
    var basename = imageFile.path.split('/').last;
    print(basename);
    await http.post(Database.hostname+"/data/uploadImage.php",body:{
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

    // pick an image from phone gallery.
    // DO NOT USE THIS FOR WEB. for web, use uploadImageWeb below

    try {
        var file = await ImagePicker.pickImage(source: ImageSource.gallery,maxHeight: 480,maxWidth: 480);
        return file;
    }
    catch(e){
      print("fail to select image");
      return null;
    }
  }

  static String uploadImageWeb(){

    // just callin this is okay

    html.InputElement uploadInput = html.FileUploadInputElement();
    List<dynamic> image;
    uploadInput.click();
    uploadInput.accept = 'image/*';
    try {
      uploadInput.onChange.listen((e) {
        var files = uploadInput.files;
        if (files.length == 1) {
          var reader = html.FileReader();
          reader.readAsArrayBuffer(files[0]);
          reader.onLoadEnd.listen((event) {
             image = [files[0].name, reader.result];
             //print(files[0].name);
             //print(reader.result);

             // add current time to file name to avoid duplicate
             DateFormat dateFormat = DateFormat("yyyy-MM-dd-HH:mm:ss");
             List<String> s = files[0].name.split(".");
             uploadWeb(s[0]+dateFormat.format(DateTime.now())+"."+s[1], reader.result);

          });
          return files[0].name;
        }
        else {
          print("more than 1 image selected.");
          return "";
        }

      });
    } on Exception catch (e) {
      print("Fail to upload image.");
      return "";
    }
  }

  static void uploadWeb(String name, Uint8List bytes)async{

    // called inside uploadImageWeb, do not call this directly

    try
    {
      print(name);
      await http.post(Database.hostname+"/data/uploadImage.php",body:{
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