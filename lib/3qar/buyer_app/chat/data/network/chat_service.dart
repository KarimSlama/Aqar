import '../model/chat_user_model.dart';

abstract class ChatService {
  Future<List<ChatUser>> fetchChatUsers();
}
