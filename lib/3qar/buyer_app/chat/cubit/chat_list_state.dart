import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/model/chat_user_model.dart';
part 'chat_list_state.freezed.dart';

@freezed
abstract class ChatListState with _$ChatListState {
  const factory ChatListState.initial() = ChatListInitial;
  const factory ChatListState.loading() = ChatListLoading;
  const factory ChatListState.loaded(List<ChatUser> users) = ChatListLoaded;
  const factory ChatListState.error(String message) = ChatListError;
}
