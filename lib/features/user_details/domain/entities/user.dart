class User {
  User({required this.name, required this.email, this.phoneNumber});
  final String name;
  final String email;
  String? phoneNumber; // Make phoneNumber optional

  User copyWith({String? phoneNumber}) {
    return User(
      name: name,
      email: email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
