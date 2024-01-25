import 'package:mozztask/core/resources/data_state.dart';
import 'package:mozztask/core/usescases/usescase.dart';
import 'package:mozztask/features/data/models/user_model.dart';
import 'package:mozztask/features/domain/repository/user_repository.dart';

class GetUsersUseCase implements UseCase<DataState<List<User>>,void> {
  final UserRepository userRepository;

  GetUsersUseCase(this.userRepository);

  @override
  Future<DataState<List<User>>> call({void params}) {
    return userRepository.getUsers();
  }
}