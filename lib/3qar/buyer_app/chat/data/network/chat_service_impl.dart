import 'package:aqar/3qar/buyer_app/chat/data/network/chat_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/chat_user_model.dart';

class ChatServiceImpl implements ChatService {
  final supabase = Supabase.instance.client;

  @override
  Future<List<ChatUser>> fetchChatUsers() async {
    try {
      final currentUserId = supabase.auth.currentUser?.id;
      if (currentUserId == null) {
        return [];
      }

      final response = await supabase
          .from('profiles')
          .select('id, full_name, image')
          .not('id', 'eq', currentUserId);

      final chatUsers =
          response.map((json) => ChatUser.fromJson(json)).toList();

      return chatUsers;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
