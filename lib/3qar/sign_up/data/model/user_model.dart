import 'package:json_annotation/json_annotation.dart';

import '../../../../core/formatters/aqar_formatters.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String? id;
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  final String? email;
  final String? phone;

  @JsonKey(name: 'about_me')
  final String? aboutMe;

  final String? password;

  final String? image;

  @JsonKey(name: 'user_type')
  final String? userType;

  const UserModel({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.image,
    required this.userType,
    this.id,
    this.password,
    this.aboutMe,
    required this.email,
  });

  UserModel copyWith(
      {String? id,
      String? firstName,
      String? lastName,
      String? userName,
      String? email,
      String? phone,
      String? password,
      String? userType,
      String? image,
      String? aboutMe}) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      image: image ?? this.image,
      userType: userType ?? this.userType,
      aboutMe: aboutMe ?? this.aboutMe,
    );
  }

  String get fullName => '$firstName $lastName';

  String get formatedPhone => AqarFormaters.formatPhoneNumber(phone!);

  static const empty = UserModel(
    firstName: '',
    lastName: '',
    phone: '',
    image: '',
    id: '',
    password: '',
    email: '',
    userType: '',
    aboutMe: '',
  );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
