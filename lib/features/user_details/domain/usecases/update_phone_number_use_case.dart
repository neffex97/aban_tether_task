import 'package:aban_tether_task/features/user_details/domain/entities/user.dart'
    show User;
import 'package:aban_tether_task/features/user_details/domain/repositories/user_details_repository.dart'
    show UserDetailsRepository;

class UpdatePhoneNumberUseCase {
  final UserDetailsRepository repository;

  UpdatePhoneNumberUseCase(this.repository);

  Future<User> call(User user, String phoneNumber) async {
    return await repository.updatePhoneNumber(user, phoneNumber);
  }
}
