import 'package:aban_tether_task/features/user_details/domain/repositories/user_details_repository.dart'
    show UserDetailsRepository;

import '../entities/user.dart';

class GetUserDetails {
  final UserDetailsRepository repository;

  GetUserDetails(this.repository);

  Future<User> call() {
    return repository.getUserDetails();
  }
}
