import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aqar/3qar/buyer_app/conversation/cubit/message_state.dart';
import 'package:aqar/3qar/buyer_app/conversation/data/repository/message_repository.dart';
import 'dart:async';

class MessageCubit extends Cubit<MessageState> {
  final MessageRepository messageRepository;
  final String _currentUserId;
  StreamSubscription? _messagesSubscription;
  String? _currentChatUserId;

  MessageCubit(this.messageRepository)
      : _currentUserId = messageRepository.getCurrentUserId(),
        super(const MessageState.initial());

  void getMessages(String userToId) {
    if (_currentChatUserId == userToId && _messagesSubscription != null) {
      return;
    }

    _currentChatUserId = userToId;
    emit(const MessageState.loading());

    _messagesSubscription?.cancel();

    _messagesSubscription = messageRepository.getMessages(userToId).listen(
      (result) {
        result.when(
          success: (messages) {
            emit(MessageState.loaded(messages, _currentUserId));
          },
          failure: (error) {
            emit(MessageState.error(error));
          },
        );
      },
    );
  }

  Future<void> sendMessage(String messageContent, String userToId) async {
    if (messageContent.trim().isEmpty) {
      emit(const MessageState.error('System can\'t send empty message'));
      return;
    }

    final result =
        await messageRepository.saveMessage(messageContent, userToId);

    result.when(
      success: (_) {},
      failure: (error) {
        emit(MessageState.error('Error sending message: $error'));

        if (state is MessageLoaded) {
          final loadedState = state as MessageLoaded;
          emit(MessageState.loaded(
              loadedState.messages, loadedState.currentUserId));
        }
      },
    );
  }

  void refreshMessages() {
    if (_currentChatUserId != null) {
      getMessages(_currentChatUserId!);
    }
  }

  @override
  Future<void> close() {
    _messagesSubscription?.cancel();
    return super.close();
  }
}
