<<<<<<< HEAD
import 'package:mozztask/core/resources/data_state.dart';
import 'package:mozztask/features/data/data_souces/remote/firebase_service.dart';
import 'package:mozztask/features/data/models/user_model.dart';
import 'package:mozztask/features/domain/repository/user_repository.dart';

=======
import 'package:mozztask/features/domain/repository/user_repository.dart';

import '../../presentation/bloc/users/users_state.dart';
import '../data_souces/remote/firebase_service.dart';

>>>>>>> 4138421c2c006cf323d9fa6f2ce5b8fede8e7176
class UserRepositoryImpl implements UserRepository {
  final FirebaseService _firebaseService;

  UserRepositoryImpl(this._firebaseService);

  @override
<<<<<<< HEAD
  Future<DataState<List<User>>> getUsers() async {
    return await _firebaseService.getUsers();
  }
}
=======
  void getUsers() {
    // No need to explicitly call getUsers here, as it's handled by the FirebaseService listener
  }

  @override
  Stream<UserState> get userStream => _firebaseService.userStream;
}
>>>>>>> 4138421c2c006cf323d9fa6f2ce5b8fede8e7176
