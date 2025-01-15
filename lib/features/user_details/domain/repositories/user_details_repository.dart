import 'package:aban_tether_task/features/user_details/domain/entities/user.dart'
    show User;

abstract class UserDetailsRepository {
  Future<User> getUserDetails();
  Future<User> updatePhoneNumber(User user, String phoneNumber);
}
