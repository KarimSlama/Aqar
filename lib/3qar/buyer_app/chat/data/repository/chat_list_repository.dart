import 'package:aqar/3qar/buyer_app/chat/data/network/chat_service.dart';
import 'package:aqar/core/network/server_result.dart';

import '../model/chat_user_model.dart';

class ChatListRepository {
  final ChatService chatService;

  ChatListRepository(this.chatService);

  Future<ServerResult<List<ChatUser>>> fetchChatUsers() async {
    try {
      final users = await chatService.fetchChatUsers();
      return ServerResult.success(users);
    } catch (e) {
      return ServerResult.failure(e.toString());
    }
  }
}
