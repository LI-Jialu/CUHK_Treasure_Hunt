// Define User class

import 'package:cuhk_treasure_hunt/classes/MessageBox.dart';
import 'package:cuhk_treasure_hunt/classes/UserBuyRequest.dart';
import 'package:cuhk_treasure_hunt/classes/UserFavourites.dart';
import 'package:cuhk_treasure_hunt/classes/UserProfile.dart';
import 'package:cuhk_treasure_hunt/classes/UserReputation.dart';

class User{

  // fields
  bool _loginStatus;

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
  }): _loginStatus = loginStatus, _userProfile = userProfile,
        _messageBox = messageBox,  _userReputation = userReputation;

  // getters
  get loginStatus => _loginStatus;
  get userProfile => _userProfile;
  get messageBox => _messageBox;
  get userReputation => _userReputation;

  // methods

  void logout(){
    _loginStatus = false;
  }


}