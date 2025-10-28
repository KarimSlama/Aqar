import 'package:freezed_annotation/freezed_annotation.dart';
part 'message_model.g.dart';

@JsonSerializable(includeIfNull: false)
class MessageModel {
  final String? id;
  final String message;
  @JsonKey(name: 'user_from')
  final String userFrom;
  @JsonKey(name: 'user_to')
  final String userTo;
  @JsonKey(name: 'mark_as_read')
  final bool markAsRead;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  const MessageModel(
      {this.id,
      required this.message,
      required this.userFrom,
      required this.userTo,
      required this.markAsRead,
      required this.createdAt});

  bool isMyMessage(String currentUserId) => userFrom == currentUserId;

  MessageModel.create(
      {required this.message, required this.userFrom, required this.userTo})
      : id = null,
        markAsRead = false,
        createdAt = DateTime.now();

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
