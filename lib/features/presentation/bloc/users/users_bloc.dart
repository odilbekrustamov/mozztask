<<<<<<< HEAD
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mozztask/core/logger/logger.dart';
import 'package:mozztask/core/resources/data_state.dart';
=======

import 'package:flutter_bloc/flutter_bloc.dart';
>>>>>>> 4138421c2c006cf323d9fa6f2ce5b8fede8e7176
import 'package:mozztask/features/presentation/bloc/users/users_event.dart';
import 'package:mozztask/features/presentation/bloc/users/users_state.dart';

import '../../../domain/usecase/get_users_usecase.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsersUseCase getUsersUseCase;

<<<<<<< HEAD
  UserBloc(this.getUsersUseCase) : super( UserInitialState()) {
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
=======

  UserBloc(this.getUsersUseCase) : super(const UserInitialState()){
    on <FetchUsersEvent> (onGetUserss);
  }

  Future<void> onGetUserss(FetchUsersEvent event, Emitter<UserState> emit) async {
    final dateState = await getUsersUseCase.execute();
    em
  }


  // @override
  // Stream<UserState> mapEventToState(UserEvent event) async* {
  //   if (event is FetchUsersEvent) {
  //     yield* _mapFetchUsersToState();
  //   }
  // }
  //
  // Stream<UserState> _mapFetchUsersToState() async* {
  //   try {
  //     final users = await getUsersUseCase.execute();
  //     yield UsersLoadedState(users);
  //   } catch (e) {
  //     yield UsersErrorState("Error fetching users: $e");
  //   }
  // }
}
>>>>>>> 4138421c2c006cf323d9fa6f2ce5b8fede8e7176
