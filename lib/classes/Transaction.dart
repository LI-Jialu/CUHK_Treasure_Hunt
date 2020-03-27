// Define Transaction class

class Transaction {

  // fields
  bool _transactionStatus; // false for not complete, true for complete
  String _transactionID;
  String _sellerID;
  String _buyerID;
  String _itemID;
  DateTime _createDate;

  // constructor
  Transaction({
    bool transactionStatus,
    String transactionID,
    String sellerID,
    String buyerID,
    String itemID,
    DateTime createDate
  }) : _transactionStatus = transactionStatus, _transactionID = transactionID, _sellerID = sellerID,
      _buyerID = buyerID, _itemID = itemID, _createDate = createDate;

  // getter
  get transactionStatus => _transactionStatus;
  get transactionID => _transactionID;
  get sellerID => _sellerID;
  get buyerID => _buyerID;
  get itemID => _itemID;
  get createDate => _createDate;

  // methods
  void completeTransaction(){
    _transactionStatus = true;

    // update in database

  }

  void cancelTransaction(){
    // delete in user's transactionInProgress

    // delete in database
  }



}