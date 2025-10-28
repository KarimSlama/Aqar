import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aqar/3qar/buyer_app/chat/cubit/chat_list_state.dart';
import 'package:aqar/3qar/buyer_app/chat/data/repository/chat_list_repository.dart';

class ChatListCubit extends Cubit<ChatListState> {
  final ChatListRepository chatListRepository;

  ChatListCubit(this.chatListRepository) : super(const ChatListState.initial());

  Future<void> fetchChatUsers() async {
    emit(const ChatListState.loading());
    final result = await chatListRepository.fetchChatUsers();
    result.when(
      success: (users) => emit(ChatListState.loaded(users)),
      failure: (error) => emit(ChatListState.error(error)),
    );
  }
}
