// define PostItem class

import 'dart:async';
import 'dart:convert';
//import 'dart:html' as html;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                  onTap: () {
                    //file = uploadImageWeb();
                    Navigator.of(context).pop(); // dismiss dialog
                  },
                ),
              ],
            )),
          );
        });
  }

  static Widget decideImageView() {
    if (picture == null) {
      return Text("You havn't selected any pictures.");
    } else {
      return Image.file(picture,
          width: SizeConfig.safeBlockHorizontal * 30,
          height: SizeConfig.safeBlockHorizontal * 30);
    }
  }

  // methods
  static void postItem(String insert, String name, String price,
      String quantity, List<String> tags, String description) async {
    var result = await Database.post('/data/manageItems.php', {
      "action": "$insert",
      "name": "$name",
      "price": "$price",
      "quantity": "$quantity",
      "description": "$description"
    });
    print(result);
  }

  static void uploadImage(File imageFile) async {
    // upload image to server give a File.
    print("start uploading");
    print(imageFile == null);
    var basename = imageFile.path.split('/').last;
    print(basename);
    await http.post(Database.hostname + "/data/uploadImage.php", body: {
      "image": base64Encode(imageFile.readAsBytesSync()),
      "name": basename
    }).then((value) {
      if (value.statusCode == 200) {
        print(value.body);
        print("image uploaded");
      }
    });
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
            uploadWeb(s[0] + dateFormat.format(DateTime.now()) + "." + s[1],
                reader.result);
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
      //print(name);
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
