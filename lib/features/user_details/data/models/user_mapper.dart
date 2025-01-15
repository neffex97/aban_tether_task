import 'package:aban_tether_task/features/user_details/domain/entities/user.dart'
    show User;

import '../models/user_model.dart';

class UserMapper {
  static User mapToEntity(UserModel model) {
    return User(
      name: model.name,
      email: model.email,
      phoneNumber: model.phoneNumber,
    );
  }

  static UserModel mapToModel(User user) {
    return UserModel(
      name: user.name,
      email: user.email,
      phoneNumber: user.phoneNumber,
    );
  }
}
