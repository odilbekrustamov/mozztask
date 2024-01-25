import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mozztask/core/logger/logger.dart';
import 'package:mozztask/core/resources/data_state.dart';
import 'package:mozztask/features/presentation/bloc/users/users_event.dart';
import 'package:mozztask/features/presentation/bloc/users/users_state.dart';

import '../../../domain/usecase/get_users_usecase.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsersUseCase getUsersUseCase;

  UserBloc(this.getUsersUseCase) : super(const UserInitialState()) {
    on<FetchUsersEvent>(onGetUserss);
  }

  Future<void> onGetUserss(
      FetchUsersEvent event, Emitter<UserState> emit) async {
    final dateState = await getUsersUseCase();
    if (dateState is DataSuccess && dateState.data!.isNotEmpty) {
      emit(UsersLoadedState(dateState.data!));
    }

    if (dateState is DataFailed) {
      emit(UsersErrorState(dateState.error!));
    }
  }
}
