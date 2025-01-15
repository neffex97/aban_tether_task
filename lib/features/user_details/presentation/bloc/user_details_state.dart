import 'package:aban_tether_task/features/user_details/domain/entities/user.dart'
    show User;

import '../../domain/entities/user.dart';

// Base state class
abstract class UserDetailsState {}

class UserDetailsInitial extends UserDetailsState {}

class UserDetailsLoading extends UserDetailsState {}

class UserDetailsLoaded extends UserDetailsState {
  final User user;

  UserDetailsLoaded(this.user);
}

class UserDetailsError extends UserDetailsState {
  final String message;

  UserDetailsError(this.message);
}

class UserDetailsSuccess extends UserDetailsState {
  final User user;
  final String message;

  UserDetailsSuccess(this.message, this.user);
}
