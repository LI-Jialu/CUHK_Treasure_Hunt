// Define User class

import 'package:cuhk_treasure_hunt/classes/UserProfile.dart';

class User{

  // fields
  bool _loginStatus;
  List<String> _itemPosted; // store itemIDs
  List<String> _transactionInProgress; //store transactionIDs

  // composites
  UserProfile _profile;

  // constructor
  // A User instance should be constructed after all its composites have been constructed.
  User({
    bool loginStatus,
    List<String> itemPosted,
    List<String> transactionInProgress,
    UserProfile profile
  }): _loginStatus = loginStatus, _itemPosted = itemPosted, _transactionInProgress = transactionInProgress,
    _profile = profile;

  // getters
  get loginStatus => _loginStatus;
  get itemPosted => _itemPosted;
  get transactionInProgress => _transactionInProgress;

  // methods
  void login(String email, String password){
    // Authentication
  }

  void logout(){
    _loginStatus = false;
  }


}