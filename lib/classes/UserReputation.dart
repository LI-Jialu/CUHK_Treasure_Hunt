import 'User.dart';

// Define UserReputation class

class UserReputation{

  // fields
  double _userReputation;

  // constructor
  UserReputation({double userReputation}): _userReputation = userReputation;

  // getter
  get userReputation => _userReputation;

  // factory constructor
  factory UserReputation.fromJson(Map<String, dynamic> json){

    return UserReputation(userReputation: double.parse(json['reputation']));

  }

  // methods
  double calculateReputation(User user){

    // get sum of ratings from database

    // return ratings/historyLength;

  }
}