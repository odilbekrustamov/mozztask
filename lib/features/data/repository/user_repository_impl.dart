import 'package:mozztask/features/domain/repository/user_repository.dart';

import '../../presentation/bloc/users/users_state.dart';
import '../data_souces/remote/firebase_service.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseService _firebaseService;

  UserRepositoryImpl(this._firebaseService);

  @override
  void getUsers() {
    // No need to explicitly call getUsers here, as it's handled by the FirebaseService listener
  }

  @override
  Stream<UserState> get userStream => _firebaseService.userStream;
}
