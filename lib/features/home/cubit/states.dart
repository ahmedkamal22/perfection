import 'package:perfection/features/home/data/models/user_model.dart';

abstract class UsersStates {}

class GetUsersInitialState extends UsersStates {}

class GetUsersLoadingState extends UsersStates {}

class GetUsersSuccessState extends UsersStates {
  final List<UserModel> users;

  GetUsersSuccessState({required this.users});
}

class GetUsersFailureState extends UsersStates {
  final String errorMessage;

  GetUsersFailureState({required this.errorMessage});
}
