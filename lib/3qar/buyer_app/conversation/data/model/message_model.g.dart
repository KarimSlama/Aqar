// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      id: json['id'] as String?,
      message: json['message'] as String,
      userFrom: json['user_from'] as String,
      userTo: json['user_to'] as String,
      markAsRead: json['mark_as_read'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'message': instance.message,
      'user_from': instance.userFrom,
      'user_to': instance.userTo,
      'mark_as_read': instance.markAsRead,
      'created_at': instance.createdAt.toIso8601String(),
    };
