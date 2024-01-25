import 'package:mozztask/features/presentation/bloc/users/users_state.dart';

abstract class UserRepository {
  void getUsers();

  Stream<UserState> get userStream;
}
