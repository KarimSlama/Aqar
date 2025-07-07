import '../../../../core/formatters/aqar_formatters.dart';

class UserModel {
  final String? id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String? password;
  final String? profilePicture;
  final String userType;

  const UserModel({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.profilePicture,
    required this.userType,
    this.id,
    this.password,
    required this.email,
  });

  UserModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? userName,
    String? email,
    String? phone,
    String? password,
    String? userType,
    String? profilePicture,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      profilePicture: profilePicture ?? this.profilePicture,
      userType: userType ?? this.userType,
    );
  }

  String get fullName => '$firstName $lastName';

  String get formatedPhone => AqarFormaters.formatPhoneNumber(phone);

  static UserModel empty() => UserModel(
      firstName: '',
      lastName: '',
      phone: '',
      profilePicture: '',
      id: '',
      password: '',
      email: '',
      userType: '');

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'full_name': fullName,
      'email': email,
      'phone': phone,
      'user_type': userType,
      'image': profilePicture ?? '',
    };
  }
}
