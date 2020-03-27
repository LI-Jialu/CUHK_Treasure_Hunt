import 'package:cuhk_treasure_hunt/utilities/constants.dart';
import 'package:cuhk_treasure_hunt/utilities/size_config.dart';
import 'package:flutter/material.dart';

class TransactionHistoryScreen extends StatefulWidget {
  @override
  _TransactionHistoryScreenState createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          // Title on top
          height: SizeConfig.safeBlockVertical * 10,
          child: Center(
              child: Text(
            "Transaction",
            style: khomescreen_title_textstyle,
          )),
        ),
        TransactionHistoryBody(),
      ],
    );
  }
}

class TransactionHistoryBody extends StatefulWidget {
  @override
  _TransactionHistoryBodyState createState() => _TransactionHistoryBodyState();
}

class _TransactionHistoryBodyState extends State<TransactionHistoryBody> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TransactionHistoryListView(),
    );
  }
}

// the scrollable list of the transaction history
class TransactionHistoryListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _TransactionHistoryListView(context);
  }

  Widget _TransactionHistoryListView(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ItemDetail(),
            ],
          );
        });
  }
}

class ItemDetail extends StatefulWidget {
  @override
  _ItemDetailState createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.safeBlockVertical * 10,
      width: SizeConfig.screenWidth,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            child: Text("2020 Mar 1"), //Date
            height: SizeConfig.safeBlockVertical * 2,
            color: Colors.grey,
          ),
          Row(
            children: <Widget>[
              Container(
                height: SizeConfig.safeBlockVertical * 15,
                width: SizeConfig.safeBlockVertical * 15,
                color: Colors.amber, // picture of the item
              ),
              GestureDetector(
                onTap: () {}, // go to item detail
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Medical Surgical Nursing Textbook",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                      child: Text(
                        r"$150",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // Buy or Sell
                height: SizeConfig.safeBlockVertical * 15,
                width: SizeConfig.safeBlockVertical * 10,
                child: Text("Buy"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
