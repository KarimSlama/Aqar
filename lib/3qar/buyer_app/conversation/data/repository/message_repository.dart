import 'package:aqar/3qar/buyer_app/conversation/data/network/message_service.dart';
import '../../../../../core/network/server_result.dart';
import '../model/message_model.dart';

class MessageRepository {
  final MessageService messageService;

  MessageRepository(this.messageService);

  Stream<ServerResult<List<MessageModel>>> getMessages(String userToId) {
    try {
      final currentUserId = messageService.getCurrentUserId();

      return messageService.getMessages(userToId).map((messages) {
        final conversationMessages = messages.where((message) {
          return (message.userFrom == currentUserId &&
                  message.userTo == userToId) ||
              (message.userFrom == userToId && message.userTo == currentUserId);
        }).toList();

        conversationMessages.sort((a, b) => a.createdAt.compareTo(b.createdAt));

        return ServerResult.success(conversationMessages);
      });
    } catch (error) {
      return Stream.value(ServerResult.failure(error.toString()));
    }
  }

  String getCurrentUserId() {
    try {
      return messageService.getCurrentUserId();
    } catch (error) {
      rethrow;
    }
  }

  Future<ServerResult<void>> saveMessage(
      String message, String userToId) async {
    try {
      if (message.trim().isEmpty) {
        return ServerResult.failure('System can\'t send empty message');
      }

      if (userToId.isEmpty) {
        return ServerResult.failure('User retrieve message id is required');
      }

      await messageService.saveMessage(message.trim(), userToId);
      return ServerResult.success(null);
    } catch (error) {
      return ServerResult.failure(
          'Error while save the message: ${error.toString()}');
    }
  }
}
