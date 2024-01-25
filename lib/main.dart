import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mozztask/features/presentation/bloc/users/users_bloc.dart';
import 'package:mozztask/features/presentation/pages/chat_page/chat_page.dart';
import 'package:mozztask/features/presentation/pages/home_page/home_page.dart';
import 'package:mozztask/injection_container.dart';

import 'config/routes/routes.dart';
import 'config/theme/app_themes.dart';
import 'features/presentation/bloc/users/users_event.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyBN1mPjruElMRodUj5hghG2vQadEQrA1Mw",
              appId: "1:770210207046:android:28e3d70f7f4275eb874147",
              messagingSenderId: "770210207046",
              projectId: 'chat-app-28db7'),
        )
      : await Firebase.initializeApp();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => sl()..add(FetchUsersEvent()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          theme: theme(),
          home: HomePage()),
    );
  }
}
