// Define User class

import 'package:cuhk_treasure_hunt/classes/MessageBox.dart';
import 'package:cuhk_treasure_hunt/classes/UserBuyRequest.dart';
import 'package:cuhk_treasure_hunt/classes/UserFavourites.dart';
import 'package:cuhk_treasure_hunt/classes/UserProfile.dart';
import 'package:cuhk_treasure_hunt/classes/UserReputation.dart';

class User{

  // fields
  bool _loginStatus;
  List<String> _transactionInProgress; //store transactionIDs

  // composites
  UserProfile _userProfile;
  MessageBox _messageBox;
  UserReputation _userReputation;

  // constructor
  // A User instance should be constructed after all its composites have been constructed.
  User({
    bool loginStatus,
    List<String> transactionInProgress,
    UserProfile userProfile,
    MessageBox messageBox,
    UserReputation userReputation
  }): _loginStatus = loginStatus, _transactionInProgress = transactionInProgress,
    _userProfile = userProfile, _messageBox = messageBox,  _userReputation = userReputation;

  // getters
  get loginStatus => _loginStatus;
  get transactionInProgress => _transactionInProgress;
  get userProfile => _userProfile;
  get messageBox => _messageBox;
  get userReputation => _userReputation;

  // methods
  void login(String email, String password){
    // Authentication
  }

  void logout(){
    _loginStatus = false;
  }


}