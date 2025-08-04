import 'package:json_annotation/json_annotation.dart';
part 'developer_request_model.g.dart';

@JsonSerializable()
class DeveloperRequestModel {
  final String? id;
  @JsonKey(name: 'company_name')
  final String? companyName;
  @JsonKey(name: 'company_logo_url')
  final String? companyLogoUrl;

  const DeveloperRequestModel({
    this.id,
    this.companyName,
    this.companyLogoUrl,
  });

  factory DeveloperRequestModel.fromJson(Map<String, dynamic> json) =>
      _$DeveloperRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeveloperRequestModelToJson(this);
}
