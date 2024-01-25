import 'package:mozztask/core/logger/logger.dart';
import 'package:mozztask/core/usescases/usescase.dart';
import 'package:mozztask/features/domain/repository/user_repository.dart';
import 'package:mozztask/features/presentation/bloc/users/users_state.dart';

class GetUsersUseCase implements UseCase<void, void> {
  final UserRepository userRepository;
  Stream<UserState> get userStream => userRepository.userStream; // Expose userStream

  GetUsersUseCase(this.userRepository);

  @override
  Future<void> call({void params}) async {
    LogService.e("dsadfasfasas");
    userRepository.getUsers();
  }
}


