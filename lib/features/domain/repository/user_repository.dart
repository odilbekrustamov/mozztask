import 'package:mozztask/core/resources/data_state.dart';
import 'package:mozztask/features/data/models/user_model.dart';

abstract class UserRepository {
  Future<DataState<List<User>>> getUsers();
}