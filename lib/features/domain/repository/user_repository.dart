<<<<<<< HEAD
import 'package:mozztask/core/resources/data_state.dart';
import 'package:mozztask/features/data/models/user_model.dart';

abstract class UserRepository {
  Future<DataState<List<User>>> getUsers();
}
=======
import 'package:mozztask/features/presentation/bloc/users/users_state.dart';

abstract class UserRepository {
  void getUsers();

  Stream<UserState> get userStream;
}
>>>>>>> 4138421c2c006cf323d9fa6f2ce5b8fede8e7176
