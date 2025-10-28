import 'package:aqar/3qar/buyer_app/conversation/data/model/message_model.dart';
import 'package:aqar/3qar/buyer_app/conversation/data/network/message_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MessageServiceImpl implements MessageService {
  final supabase = Supabase.instance.client;

  @override
  Stream<List<MessageModel>> getMessages(String userToId) {
    try {
      final messages = supabase
          .from('messages')
          .stream(primaryKey: ['id'])
          .order('created_at')
          .map((item) =>
              item.map((message) => MessageModel.fromJson(message)).toList());
      return messages;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future<void> saveMessage(String content, String userToId) async {
    try {
      final userFromId = getCurrentUserId();
      if (userFromId.isEmpty) {
        throw Exception(
            'User not authenticated or ID is empty. Cannot send message.');
      }

      if (userToId.isEmpty) {
        throw Exception(
            'Recipient User ID (userToId) is empty. Cannot send message.');
      }

      final message = MessageModel.create(
          message: content, userFrom: userFromId, userTo: userToId);

      Map<String, dynamic> messageData = message.toJson();

      if (messageData['id'] == null) {
        messageData.remove('id');
      }

      await supabase.from('messages').insert(messageData);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  String getCurrentUserId() {
    final currentUser = supabase.auth.currentUser;
    if (currentUser == null) {
      throw Exception('User is not authenticated.');
    }
    return currentUser.id;
  }
}
