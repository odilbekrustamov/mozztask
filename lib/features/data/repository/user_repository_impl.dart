import 'package:mozztask/core/resources/data_state.dart';
import 'package:mozztask/features/data/data_souces/remote/firebase_service.dart';
import 'package:mozztask/features/data/models/user_model.dart';
import 'package:mozztask/features/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseService _firebaseService;

  UserRepositoryImpl(this._firebaseService);

  @override
  Future<DataState<List<User>>> getUsers() async {
    return await _firebaseService.getUsers();
  }
}