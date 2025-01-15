import 'package:aban_tether_task/core/utils/validators.dart';
import 'package:aban_tether_task/features/user_details/domain/repositories/user_details_repository.dart';
import 'package:aban_tether_task/features/user_details/domain/usecases/get_user_details_use_case.dart';
import 'package:aban_tether_task/features/user_details/presentation/bloc/user_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  final GetUserDetails getUserDetailsUseCase;
  final UserDetailsRepository userRepository;

  UserDetailsCubit(this.userRepository, {required this.getUserDetailsUseCase})
    //
    : super(UserDetailsInitial()) {
    _fetchUserDetails(); // Load data on initialization
  }

  late User _user;

  Future<void> _fetchUserDetails() async {
    try {
      emit(UserDetailsLoading());
      final user = await getUserDetailsUseCase.call();
      _user = user;
      emit(UserDetailsLoaded(_user)); // Transition to loaded state
    } catch (e) {
      emit(UserDetailsError('Failed to load user details. Please try again.'));
    }
  }

  Future<void> validateAndSubmitPhoneNumber(String phoneNumber) async {
    if (!Validators.isValidIranianPhoneNumber(phoneNumber)) {
      emit(UserDetailsError('Invalid phone number. Please try again.'));
      return;
    }
    emit(UserDetailsLoading());
    try {
      _user = await userRepository.updatePhoneNumber(_user, phoneNumber);

      emit(UserDetailsSuccess('Phone number updated successfully.', _user));
    } catch (e) {
      emit(UserDetailsError('Failed to update phone number: $e'));
    }
  }
}
