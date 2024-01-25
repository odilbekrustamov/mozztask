import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mozztask/features/data/data_souces/remote/firebase_service.dart';
import 'package:mozztask/features/data/repository/user_repository_impl.dart';
import 'package:mozztask/features/domain/repository/user_repository.dart';
import 'package:mozztask/features/domain/usecase/get_users_usecase.dart';
import 'package:mozztask/features/presentation/bloc/users/users_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<FirebaseService>(FirebaseService(sl()));

  sl.registerSingleton<UserRepository>(
      UserRepositoryImpl(sl())
  );

  //UseCases
  sl.registerSingleton<GetUsersUseCase>(
      GetUsersUseCase(sl())
  );


  //Blocs
  sl.registerFactory<UserBloc>(
          ()=> UserBloc(sl())
  );
}