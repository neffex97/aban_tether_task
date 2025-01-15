import '../models/user_model.dart';

abstract class UserDetailsRemoteDataSource {
  Future<UserModel> fetchUserDetails();
  Future<UserModel> updatePhoneNumber(UserModel user, String phoneNumber);
}

class UserDetailsRemoteDataSourceImpl implements UserDetailsRemoteDataSource {
  @override
  Future<UserModel> fetchUserDetails() async {
    // Simulated API response
    await Future.delayed(const Duration(seconds: 1));
    return UserModel(
      name: "Hossein Moosavi",
      email: "hosseinmoosavi97@gmail.com",
    );
  }

  @override
  Future<UserModel> updatePhoneNumber(UserModel user, String phoneNumber) {
    // Simulated API response
    return Future.delayed(const Duration(seconds: 1), () {
      return user.copyWith(phoneNumber: phoneNumber);
    });
  }
}
