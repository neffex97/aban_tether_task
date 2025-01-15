class UserModel {
  UserModel({required this.name, required this.email, this.phoneNumber});

  final String name;
  final String email;
  final String? phoneNumber;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
    );
  }

  UserModel copyWith({String? name, String? email, String? phoneNumber}) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
