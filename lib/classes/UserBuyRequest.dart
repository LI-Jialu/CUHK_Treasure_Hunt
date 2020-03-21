// define UserBuyRequest class

class UserBuyRequest {

  // fields
  List<String> _buyRequest;

  // constructor
  UserBuyRequest({List<String> buyRequest}): _buyRequest = buyRequest;

  // getters
  get buyRequest => _buyRequest;

  // methods
  void makeBuyRequest(String ID){
    _buyRequest.add((ID));
    // Todo: update in database
  }

  void cancelBuyRequest(String ID){
    _buyRequest.remove(ID);
    // Todo: update in database
  }

}