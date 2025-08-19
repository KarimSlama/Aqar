import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:aqar/3qar/buyer_app/conversation/data/model/message_model.dart';

part 'message_state.freezed.dart';

@freezed
abstract class MessageState with _$MessageState {
  const factory MessageState.initial() = MessageInitial;
  const factory MessageState.loading() = MessageLoading;
  const factory MessageState.loaded(
      List<MessageModel> messages, String currentUserId) = MessageLoaded;
  const factory MessageState.error(String errorMessage) = MessageError;
}
