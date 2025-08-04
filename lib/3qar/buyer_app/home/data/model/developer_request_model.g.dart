// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'developer_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeveloperRequestModel _$DeveloperRequestModelFromJson(
        Map<String, dynamic> json) =>
    DeveloperRequestModel(
      id: json['id'] as String?,
      companyName: json['company_name'] as String?,
      companyLogoUrl: json['company_logo_url'] as String?,
    );

Map<String, dynamic> _$DeveloperRequestModelToJson(
        DeveloperRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company_name': instance.companyName,
      'company_logo_url': instance.companyLogoUrl,
    };
