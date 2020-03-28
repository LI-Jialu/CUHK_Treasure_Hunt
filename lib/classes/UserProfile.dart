// define UserProfile class

class UserProfile{

  // fields
  String _userID;
  String _username;
  String _college;    //expressed as 2 alphabets, e.g. NA
  int _year;
  String _dorm;

  // constructor
  UserProfile({
    String userID,
    String username,
    String college,
    int year,
    String dorm
  }): _userID = userID, _username = username, _college = college, _year = year, _dorm = dorm;


  // getters
  String get userID => _userID;
  String get username => _username;
  String get college => _college;
  int get year => _year;
  String get dorm => _dorm;

  // factory constructor
  factory UserProfile.fromJson(Map<String, dynamic> json){

    return UserProfile(
      userID: json["user_id"],
      username: json["username"],
      college: json["college"],
      year: int.parse(json["year"]),
      dorm: json["dorm"]
    );

  }


  // methods

  void changeUserProfile(){

  }

  String checkUsername(){  // check whether input is valid
    return "Success";
  }

  // ... similar


}