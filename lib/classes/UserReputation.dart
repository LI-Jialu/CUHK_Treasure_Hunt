import 'User.dart';

// Define UserReputation class

class UserReputation{

  // fields
  double _userReputation;

  // constructor
  UserReputation({double userReputation}): _userReputation = userReputation;

  // methods
  double calculateReputation(User user){

    int historyLength = user.userHistory.length;

    // get sum of ratings from database

    // return ratings/historyLength;

  }
}