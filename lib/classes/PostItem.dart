// define PostItem class

import 'dart:async';
import 'dart:convert';
//import 'dart:html' as html;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
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
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';

class PostItem {
  static var picture;
  static String webImageName;

  // alert pickup image from web or gallery
  static Future<File> showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Make a choice"),
            content: SingleChildScrollView(
                child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text("Gallery"),
                  onTap: () async {
                    picture = await pickImage();
                    Navigator.of(context).pop(); // dismiss dialog
                  },
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: Text("Web upload"),
                  onTap: () async {
                    await uploadImageWeb();
                    Navigator.of(context).pop(); // dismiss dialog
                  },
                ),
              ],
            )),
          );
        });
  }

  static Widget decideImageView() {
    if (kIsWeb){
      if (webImageName == null){
        return Column(
          children: <Widget>[Container(
          decoration: new BoxDecoration(
            border: new Border.all(color: Colors.grey, width: 0.5),
          ),
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset("assets/images/plus.png"),
          ),
          height: SizeConfig.safeBlockHorizontal * 30,
          width: SizeConfig.safeBlockHorizontal * 30,
        )]
        );      
        }
      else {
        print(Database.hostname+"/data/images/"+webImageName);
        return Column(
          children: <Widget>[SizedBox(
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.network(Database.hostname+"/data/images/"+webImageName),
          ),
          height: SizeConfig.safeBlockHorizontal * 30,
          width: SizeConfig.safeBlockHorizontal * 30,
        )]
        );//return Text("$webImageName chosen");
      }
    }
    else
    {
      if (picture == null) {
        return Column(
          children: <Widget>[Container(
          decoration: new BoxDecoration(
            border: new Border.all(color: Colors.grey, width: 0.5),
          ),
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset("assets/images/plus.png"),
          ),
          height: SizeConfig.safeBlockHorizontal * 30,
          width: SizeConfig.safeBlockHorizontal * 30,
        )]
        );      
      } else {
        return Column(
          children: <Widget>[SizedBox(
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.file(picture),
          ),
          width: SizeConfig.safeBlockHorizontal * 30,
          height: SizeConfig.safeBlockHorizontal * 30,
        )]
        );
      }
    }
  }

  // methods
  static Future<String> postItem(String insert, String name, String price,
      String quantity, String description,String imageName) async {
    Map query = {
      "action": "$insert",
      "name": "$name",
      "price": "$price",
      "quantity": "$quantity",
      "description": "$description",
      "image" : "$imageName"
    };
    String path = '/data/manageItems.php';
    String url =  Database.hostname + path;
    http.Response response = await http.post(url,headers: {'authorization':Database.basicAuth},body: query);
    if (response.statusCode == 200){
      return response.body;
    }
    else {
      return "fail";
    }
  }

  static void postTags(String itemID, List<int> tags)async{
    String tagsString = tags.join(",");
    var response = await Database.post(
      "/data/postTags.php",
      {"item_id":itemID,"tags":tagsString}
    );
    print(response);
  }

  static Future<String> uploadImage(File imageFile) async {
    // upload image to server give a File.
    print("start uploading");
    print(imageFile == null);
    var basename = imageFile.path.split('/').last;
    print(basename);
    Response response = await http.post(Database.hostname + "/data/uploadImage.php", body: {
      "image": base64Encode(imageFile.readAsBytesSync()),
      "name": basename
    });
    if (response.statusCode == 200) {
      print(response.body);
      print("image uploaded");
    }
    return basename;
  }

  static Future<File> pickImage() async {
    // pick an image from phone gallery.
    // DO NOT USE THIS FOR WEB. for web, use uploadImageWeb below
    try {
      var file = await ImagePicker.pickImage(
          //     source: ImageSource.gallery, maxHeight: 480, maxWidth: 480);
          source: ImageSource.gallery);
      return file;
    } catch (e) {
      print("fail to select image");
      return null;
    }
  }

  static void uploadImageWeb() {
    // just calling this is okay

    html.InputElement uploadInput = html.FileUploadInputElement();
    uploadInput.click();
    uploadInput.accept = 'image/*';
    try {
      uploadInput.onChange.listen((e) {
        var files = uploadInput.files;
        if (files.length == 1) {
          var reader = html.FileReader();
          reader.readAsArrayBuffer(files[0]);
          reader.onLoadEnd.listen((event) {
            print(files[0].name);
            //print(reader.result);
            //add current time to file name to avoid duplicate
            DateFormat dateFormat = DateFormat("yyyy-MM-dd-HH:mm:ss");
            List<String> s = files[0].name.split(".");
            webImageName = s[0] + dateFormat.format(DateTime.now()) + "." + s[1];
            uploadWeb(webImageName, reader.result);

          });
        } else {
          print("more than 1 image selected.");
        }
      });
    } on Exception catch (e) {
      print("Fail to upload image.");
    }
  }

  static void uploadWeb(String name, Uint8List bytes) async {
    // called inside uploadImageWeb, do not call this directly

    try {
      print(name);
      await http.post(Database.hostname + "/data/uploadImage.php",
          body: {"image": base64Encode(bytes), "name": name}).then((value) {
        if (value.statusCode == 200) {
          print(value.body);
          print("image uploaded");
        }
      });
    } catch (e) {
      print(bytes == null);
      print("Failure");
    }
  }
}
