import 'package:cuhk_treasure_hunt/classes/User.dart';
import 'package:cuhk_treasure_hunt/database/Database.dart';
import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'chatroom_screen.dart';

/*
  Accessed when an item in posted_item_screen is clicked.
  This Screen shows the details of the item, and the buyers
  User can Select a buyer and proceed to create transaction.
 */


class PostedItemDetailScreen extends StatefulWidget{

  var item;
  var buyers;

  PostedItemDetailScreen({this.item, this.buyers});

  @override
  PostedItemDetailScreenState createState() {
    return PostedItemDetailScreenState();
  }

}

class PostedItemDetailScreenState extends State<PostedItemDetailScreen>{

  bool showBuyers = false;
  String selectedID = "";
  String selectedName = "";
  bool buyerSelected = false;
  String quantity = "";

  Future<bool> createTransaction()async{
    bool result = await Database.post(
      "/data/manageTransactions.php",
      {'action':'insert','seller_id':'${User.userID}','buyer_id':'$selectedID','item_id':'${widget.item['item_id']}',
      'price':'${widget.item['price']}','quantity':'$quantity'}
    );
    return result;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    EdgeInsets padding = EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*5, right: SizeConfig.safeBlockHorizontal*5);
    return Scaffold(
      appBar: AppBar(title: Text("Posted Item Detail"),),
      body: Container(
        padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*2, right: SizeConfig.safeBlockHorizontal*2),
        child: ListView(
          children: <Widget>[
            Container(
              height: SizeConfig.safeBlockVertical*50,
              width: SizeConfig.safeBlockHorizontal*100,
              child:
                  Image.network(Database.hostname+"/data/images/"+widget.item['image'], height: SizeConfig.safeBlockVertical * 50, width: SizeConfig.safeBlockVertical * 100),
              ),
            Container(
              height: SizeConfig.safeBlockVertical*5,
              padding: padding,
              alignment: Alignment.bottomLeft,
              child: Text(widget.item['name'], style: kmiddle_black_textstyle),
            ),
            Container(
              height: SizeConfig.safeBlockVertical*5,
              padding: padding,
              alignment: Alignment.bottomLeft,
              child: Text("\$" + widget.item['price'], style: kmiddle_red_textstyle),
            ),
            Container(
              height: SizeConfig.safeBlockVertical*5,
              padding: padding,
              alignment: Alignment.bottomLeft,
                child: Text("Quantity: ${widget.item['quantity']}", style: kmiddle_black_textstyle),
            ),
            Container(
              padding: padding,
              height: SizeConfig.safeBlockVertical*5,
              alignment: Alignment.centerLeft,
              child: Text('More descriptions', style: ksmall_black_textstyle),
            ),
            Container(
              padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*5, right: SizeConfig.safeBlockHorizontal*5, bottom: SizeConfig.safeBlockHorizontal*5),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.5),
                ),
                padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal*5),
                child: Text(widget.item['description'], style: ksmall_black_textstyle),
              ),
            ),
            Container(
              padding: padding,
              child: OutlineButton(
                child: buyerSelected? Text("$selectedName selected"):Text("Select a buyer"),
                onPressed: (){
                  setState(() {
                    showBuyers = true;
                    print(showBuyers);
                  });
                },
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: showBuyers? 100:0,
              child: ListView.builder(
                itemCount: widget.buyers.length,
                itemBuilder: (BuildContext context, int index){
                  var buyer = widget.buyers[index];
                  return Container(
                    padding: padding,
                    height: SizeConfig.safeBlockVertical*5,
                    child: GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Center(
                            child: Text("${buyer['username']}"),
                          ),
                          Center(
                            child: Text("Quantity: ${buyer['quantity']}"),
                          ),
                          IconButton(
                            icon: Icon(Icons.mail),
                            onPressed: (){
                              print("go to chat");
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ChatroomScreen(
                                  contact_name:buyer['username'],
                                  user_id: buyer['buyer_id'],)),
                              );
                            },
                          )
                        ],
                      ),
                      onTap: (){
                        setState(() {
                          showBuyers = false;
                          buyerSelected = true;
                          selectedID = buyer['buyer_id'];
                          selectedName = buyer['username'];
                          quantity = buyer['quantity'];
                        });
                      },
                    ),
                  );
                }),
            ),
            Divider(),
            FlatButton(
              color: Colors.amber,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: buyerSelected?() async{
                bool result = await createTransaction();
                if (result){
                  showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text("Make a choice"),
                        content: Text("Create Transaction Success")
                      );
                    }
                  );
                }
                else {
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                            title: Text("Make a choice"),
                            content: Text("Fail To Create Transaction")
                        );
                      }
                  );
                }
              }:null,
              child: Text(
                "Create Transaction",
                style: TextStyle(fontSize: 20.0),
              ),
            )
          ],
        ),
      ),
    );
  }

}