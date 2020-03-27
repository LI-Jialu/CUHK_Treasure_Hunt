// Define UserHistory class

class UserHistory{

  // fields
  List<String> _userHistory; // store the transaction IDs of completed transactions in the past

  // constructor
  UserHistory({List<String> userHistory}): _userHistory = userHistory;

  // getters
  get userHistory => _userHistory;

  // methods
  void addHistoryItem(String transactionID){
    _userHistory.add(transactionID);

    // TODO: add in database
  }

}