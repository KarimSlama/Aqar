import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_user_model.g.dart';

@JsonSerializable()
class ChatUser {
  final String id;
  @JsonKey(name: 'full_name')
  final String fullName;
  final String image;

  const ChatUser(
      {required this.id, required this.fullName, required this.image});

  factory ChatUser.fromJson(Map<String, dynamic> json) =>
      _$ChatUserFromJson(json);
}
