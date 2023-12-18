import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/listeners/room_data.dart';
import 'package:tictactoe/screens/create_room_screen.dart';
import 'package:tictactoe/screens/game_screen.dart';
import 'package:tictactoe/screens/join_room_screen.dart';
import 'package:tictactoe/screens/main_menu_screen.dart';
import 'package:tictactoe/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<RoomData> (
          create: (context) => RoomData()
        )
      ],
      child: MaterialApp(
        title: 'TicTacToe',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: bgColor
        ),
        home: const MainMenuScreen(),
        routes: {
          MainMenuScreen.routeName:(context) => const MainMenuScreen(),
          CreateRoomScreen.routeName:(context) => const CreateRoomScreen(),
          JoinRoomScreen.routeName:(context) => const JoinRoomScreen(),
          GameScreen.routename:(context) => const GameScreen()
        },
        initialRoute: MainMenuScreen.routeName
      ),
    );
  }
}