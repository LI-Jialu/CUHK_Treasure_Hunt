// Define MessageBox class

class MessageBox {

  // fields
  List<String> _receivedMessages;
  List<String> _sentMessages;

  // constructor
  MessageBox ({
    List<String> receivedMessages,
    List<String> sentMessages
  }) : _receivedMessages = receivedMessages, _sentMessages = sentMessages;

  // getters
  get receivedMessages => _receivedMessages;
  get sentMessages => _sentMessages;

  //methods
  void sendMessages(String receiverID, String message){

    _sentMessages.add(message);

    // add in database
    // add in sender's sentMessages
    // add in receiver's receivedMessages

  }

}