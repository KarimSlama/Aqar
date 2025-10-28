// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatUser _$ChatUserFromJson(Map<String, dynamic> json) => ChatUser(
      id: json['id'] as String,
      fullName: json['full_name'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$ChatUserToJson(ChatUser instance) => <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'image': instance.image,
    };
