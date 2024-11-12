import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfection/features/home/cubit/states.dart';
import 'package:perfection/features/home/data/models/user_model.dart';
import 'package:perfection/features/home/data/repositories/user_repository.dart';

class UsersCubit extends Cubit<UsersStates> {
  final UserRepository userRepository;

  UsersCubit(this.userRepository) : super(GetUsersInitialState());

  int _currentPage = 1;
  List<UserModel> users = [];

  Future<void> fetchUsers() async {
    emit(GetUsersLoadingState());
    _currentPage = 1;
    users.clear();

    try {
      while (true) {
        final response = await userRepository.fetchUsers(_currentPage);
        users.addAll(response.data);

        if (_currentPage >= response.totalPages) break;

        _currentPage++;
      }
      emit(GetUsersSuccessState(users: users));
    } catch (error) {
      emit(GetUsersFailureState(errorMessage: error.toString()));
    }
  }

// Future<void> fetchUsers() async {
//
//   emit(GetUsersLoadingState());
//
//   try {
//     final response = await userRepository.fetchUsers(_currentPage);
//     users.addAll(response.data);
//     _currentPage++;
//     emit(GetUsersSuccessState(users: users));
//   } catch (error) {
//     emit(GetUsersFailureState(errorMessage: error.toString()));
//   }
// }
}
