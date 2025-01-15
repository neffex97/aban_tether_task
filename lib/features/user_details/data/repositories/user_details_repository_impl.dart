import 'package:aban_tether_task/features/user_details/data/datasource/user_details_remote_datasource.dart'
    show UserDetailsRemoteDataSource;
import 'package:aban_tether_task/features/user_details/data/models/user_mapper.dart'
    show UserMapper;
import 'package:aban_tether_task/features/user_details/domain/entities/user.dart'
    show User;
import 'package:aban_tether_task/features/user_details/domain/repositories/user_details_repository.dart'
    show UserDetailsRepository;

class UserDetailsRepositoryImpl implements UserDetailsRepository {
  final UserDetailsRemoteDataSource remoteDataSource;

  UserDetailsRepositoryImpl(this.remoteDataSource);

  @override
  Future<User> getUserDetails() async {
    try {
      final userModel = await remoteDataSource.fetchUserDetails();
      return UserMapper.mapToEntity(userModel);
    } catch (e) {
      throw Exception('Failed to fetch user details: $e');
    }
  }

  @override
  Future<User> updatePhoneNumber(User user, String phoneNumber) async {
    try {
      final updatedUserModel = await remoteDataSource.updatePhoneNumber(
        UserMapper.mapToModel(user),
        phoneNumber,
      );
      return UserMapper.mapToEntity(updatedUserModel);
    } catch (e) {
      throw Exception('Failed to update phone number: $e');
    }
  }
}
