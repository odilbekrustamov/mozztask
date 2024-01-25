<<<<<<< HEAD
import 'package:mozztask/core/resources/data_state.dart';
import 'package:mozztask/core/usescases/usescase.dart';
import 'package:mozztask/features/data/models/user_model.dart';
import 'package:mozztask/features/domain/repository/user_repository.dart';

class GetUsersUseCase implements UseCase<DataState<List<User>>,void> {
  final UserRepository userRepository;
=======
import 'package:mozztask/core/logger/logger.dart';
import 'package:mozztask/core/usescases/usescase.dart';
import 'package:mozztask/features/domain/repository/user_repository.dart';
import 'package:mozztask/features/presentation/bloc/users/users_state.dart';

class GetUsersUseCase implements UseCase<void, void> {
  final UserRepository userRepository;
  Stream<UserState> get userStream => userRepository.userStream; // Expose userStream
>>>>>>> 4138421c2c006cf323d9fa6f2ce5b8fede8e7176

  GetUsersUseCase(this.userRepository);

  @override
<<<<<<< HEAD
  Future<DataState<List<User>>> call({void params}) {
    return userRepository.getUsers();
  }
}
=======
  Future<void> call({void params}) async {
    LogService.e("dsadfasfasas");
    userRepository.getUsers();
  }
}


>>>>>>> 4138421c2c006cf323d9fa6f2ce5b8fede8e7176
