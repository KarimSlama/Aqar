import 'package:aqar/3qar/buyer_app/conversation/data/model/message_model.dart';

abstract class MessageService {
  Stream<List<MessageModel>> getMessages(String userToId);
  String getCurrentUserId();
  Future<void> saveMessage(String message, String userToId);
}
