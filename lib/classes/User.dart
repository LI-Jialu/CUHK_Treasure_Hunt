// Define User class

import 'dart:html';

import 'package:cuhk_treasure_hunt/classes/MessageBox.dart';
import 'package:cuhk_treasure_hunt/classes/UserBuyRequest.dart';
import 'package:cuhk_treasure_hunt/classes/UserFavourites.dart';
import 'package:cuhk_treasure_hunt/classes/UserProfile.dart';
import 'package:cuhk_treasure_hunt/classes/UserReputation.dart';

class User{

  // fields
  bool _loginStatus;
  List<String> _itemPosted; // store itemIDs
  List<String> _transactionInProgress; //store transactionIDs

  // composites
  UserProfile _userProfile;
  UserFavourites _userFavourites;
  UserBuyRequest _userBuyRequest;
  MessageBox _messageBox;
  History _userHistory;
  UserReputation _userReputation;

  // constructor
  // A User instance should be constructed after all its composites have been constructed.
  User({
    bool loginStatus,
    List<String> itemPosted,
    List<String> transactionInProgress,
    UserProfile userProfile,
    UserFavourites userFavourites,
    UserBuyRequest userBuyRequest,
    MessageBox messageBox,
    History userHistory,
    UserReputation userReputation
  }): _loginStatus = loginStatus, _itemPosted = itemPosted, _transactionInProgress = transactionInProgress,
    _userProfile = userProfile, _userFavourites = userFavourites, _userBuyRequest = userBuyRequest,
    _messageBox = messageBox, _userHistory = userHistory, _userReputation = userReputation;

  // getters
  get loginStatus => _loginStatus;
  get itemPosted => _itemPosted;
  get transactionInProgress => _transactionInProgress;
  get userProfile => _userProfile;
  get userFavourites => _userFavourites;
  get userBuyRequest => _userBuyRequest;
  get messageBox => _messageBox;
  get userHistory => _userHistory;
  get userReputation => _userReputation;

  // methods
  void login(String email, String password){
    // Authentication
  }

  void logout(){
    _loginStatus = false;
  }


}