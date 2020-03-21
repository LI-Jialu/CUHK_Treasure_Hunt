// define UserFavourites class

class UserFavourites {

  // fields
  List<String> _favourites;   // store ID of favourite items

  // constructor
  UserFavourites({List<String> favourites}): _favourites = favourites;

  // getters
  get favourites => _favourites;

  //methods
  void addFavouriteItem(String ID){
    _favourites.add(ID);
    // Todo: add in DB
  }

  void deleteFavouriteItem(String ID){
    _favourites.remove(ID);
    // Todo: delete in DB
  }

}