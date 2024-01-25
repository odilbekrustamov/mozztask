<<<<<<< HEAD
=======
import 'package:dio/dio.dart';
>>>>>>> 4138421c2c006cf323d9fa6f2ce5b8fede8e7176
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mozztask/core/logger/logger.dart';
import 'package:mozztask/features/presentation/bloc/users/users_bloc.dart';
import 'package:mozztask/features/presentation/bloc/users/users_state.dart';

<<<<<<< HEAD
import '../../../data/models/user_model.dart';
import '../../widgets/user_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
=======
import '../../../data/data_souces/remote/firebase_service.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repository/user_repository_impl.dart';
import '../../../domain/usecase/get_users_usecase.dart';
import '../../bloc/users/users_event.dart';
import '../../widgets/user_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
>>>>>>> 4138421c2c006cf323d9fa6f2ce5b8fede8e7176

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
<<<<<<< HEAD
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Container(
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Text(
              "Чаты",
              style: TextStyle(
                  color: Color(0xFF2B333E),
                  fontSize: 32,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.bold),
            ),
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu), // You can use any icon you prefer
                onPressed: () {
                  // Add your menu button logic here
                },
              );
            },
          ),
        ),
        body: _buildBody());
  }

  _buildBody() {
    return BlocBuilder<UserBloc, UserState>(
      builder: (_, state) {
        if (state is UserInitialState) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state is UsersErrorState) {
          return const Center(
            child: Icon(Icons.refresh),
          );
        }
        if (state is UsersLoadedState) {
=======
  late UserBloc _userBloc;

  @override
  void initState() {
    super.initState();
    _userBloc = UserBloc(GetUsersUseCase(UserRepositoryImpl(FirebaseService(Dio()))));
    _userBloc.add(FetchUsersEvent());
  }

  @override
  void dispose() {
    _userBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          width: double.infinity,
          alignment: Alignment.centerLeft,
          child: Text(
            "Chat",
            style: TextStyle(
              color: Color(0xFF2B333E),
              fontSize: 32,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            );
          },
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return StreamBuilder<UserState>(
      stream: _userBloc.stream, // Stream of user states
      builder: (context, snapshot) {
        LogService.e("Snapshot data: ${snapshot.data}");
        LogService.e("UserBloc state: ${_userBloc.state}");
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Icon(Icons.refresh),
          );
        } else if (snapshot.hasData && snapshot.data is UsersLoadedState) {
          var state = snapshot.data!;
>>>>>>> 4138421c2c006cf323d9fa6f2ce5b8fede8e7176
          LogService.i(state.users!.length.toString());
          return Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
<<<<<<< HEAD
                //search
                Container(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Поиск',
                      hintStyle: TextStyle(
                        color: Color(0xFF9DB7CB),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xFF9DB7CB),
                        size: 32,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Color(0xFFEDF2F6),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                //list
=======
                // Search
                Container(
                  height: 50,
                  child: TextField(
                    // Your search field
                  ),
                ),
                SizedBox(height: 10),
                // List
>>>>>>> 4138421c2c006cf323d9fa6f2ce5b8fede8e7176
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return UserView(
<<<<<<< HEAD
                          user: state.users![index],
                          onUserPressed: (user) {
                            _onUserPressed(context, user);
                          });
                    },
                    itemCount: state.users!.length,
                  ),
                )
              ],
            ),
          );
        }
        return Container(
          color: Colors.blue,
        );
=======
                        user: state.users![index],
                        onUserPressed: (user) {
                          _onUserPressed(context, user);
                        },
                      );
                    },
                    itemCount: state.users!.length,
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container(
            color: Colors.blue,
          );
        }
>>>>>>> 4138421c2c006cf323d9fa6f2ce5b8fede8e7176
      },
    );
  }

  void _onUserPressed(BuildContext context, User user) {
    Navigator.pushNamed(context, '/ChatPage', arguments: user);
  }
}
<<<<<<< HEAD
=======



// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           title: Container(
//             width: double.infinity,
//             alignment: Alignment.centerLeft,
//             child: Text(
//               "Чаты",
//               style: TextStyle(
//                   color: Color(0xFF2B333E),
//                   fontSize: 32,
//                   fontFamily: 'Gilroy',
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//           leading: Builder(
//             builder: (BuildContext context) {
//               return IconButton(
//                 icon: Icon(Icons.menu), // You can use any icon you prefer
//                 onPressed: () {
//                   // Add your menu button logic here
//                 },
//               );
//             },
//           ),
//         ),
//         body: _buildBody());
//   }
//
//   _buildBody() {
//     return BlocBuilder<UserBloc, UserState>(
//       builder: (_, state) {
//         if (state is UserInitialState) {
//           return const Center(
//             child: CupertinoActivityIndicator(),
//           );
//         }
//         if (state is UsersErrorState) {
//           return const Center(
//             child: Icon(Icons.refresh),
//           );
//         }
//         if (state is UsersLoadedState) {
//           LogService.i(state.users!.length.toString());
//           return Container(
//             color: Colors.white,
//             padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//             child: Column(
//               children: [
//                 //search
//                 Container(
//                   height: 50,
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: 'Поиск',
//                       hintStyle: TextStyle(
//                         color: Color(0xFF9DB7CB),
//                         fontSize: 16,
//                         fontWeight: FontWeight.normal,
//                       ),
//                       prefixIcon: Icon(
//                         Icons.search,
//                         color: Color(0xFF9DB7CB),
//                         size: 32,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide.none,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide.none,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       filled: true,
//                       fillColor: Color(0xFFEDF2F6),
//                     ),
//                   ),
//                 ),
//
//                 SizedBox(
//                   height: 10,
//                 ),
//                 //list
//                 Expanded(
//                   child: ListView.builder(
//                     itemBuilder: (context, index) {
//                       return UserView(
//                           user: state.users![index],
//                           onUserPressed: (user) {
//                             _onUserPressed(context, user);
//                           });
//                     },
//                     itemCount: state.users!.length,
//                   ),
//                 )
//               ],
//             ),
//           );
//         }
//         return Container(
//           color: Colors.blue,
//         );
//       },
//     );
//   }
//
//   void _onUserPressed(BuildContext context, User user) {
//     Navigator.pushNamed(context, '/ChatPage', arguments: user);
//   }
// }
>>>>>>> 4138421c2c006cf323d9fa6f2ce5b8fede8e7176
