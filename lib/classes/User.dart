// Define User class

import 'package:cuhk_treasure_hunt/classes/UserBuyRequest.dart';
import 'package:cuhk_treasure_hunt/classes/UserFavourites.dart';
import 'package:cuhk_treasure_hunt/classes/UserProfile.dart';

class User{

  // fields
  bool _loginStatus;
  List<String> _itemPosted; // store itemIDs
  List<String> _transactionInProgress; //store transactionIDs

  // composites
  UserProfile _userProfile;
  UserFavourites _userFavourites;
  UserBuyRequest _userBuyRequest;
  // Todo: messageBox, History, Reputation

  // constructor
  // A User instance should be constructed after all its composites have been constructed.
  User({
    bool loginStatus,
    List<String> itemPosted,
    List<String> transactionInProgress,
    UserProfile userProfile,
    UserFavourites userFavourites,
    UserBuyRequest userBuyRequest
  }): _loginStatus = loginStatus, _itemPosted = itemPosted, _transactionInProgress = transactionInProgress,
    _userProfile = userProfile, _userFavourites = userFavourites, _userBuyRequest = userBuyRequest;

  // getters
  get loginStatus => _loginStatus;
  get itemPosted => _itemPosted;
  get transactionInProgress => _transactionInProgress;
  get userProfile => _userProfile;
  get userFavourites => _userFavourites;
  get userBuyRequest => _userBuyRequest;

  // methods
  void login(String email, String password){
    // Authentication
  }

  void logout(){
    _loginStatus = false;
  }


}