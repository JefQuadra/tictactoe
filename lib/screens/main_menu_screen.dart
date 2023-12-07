import 'package:flutter/material.dart';
import 'package:tictactoe/screens/create_room_screen.dart';
import 'package:tictactoe/screens/join_room_screen.dart';
import 'package:tictactoe/widgets/custom_button.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = "/main-menu";
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
                onTap: () {
                  Navigator.of(context).pushNamed(CreateRoomScreen.routeName);
                },
                text: "Create Room"),
            const SizedBox(height: 20),
            CustomButton(
                onTap: () {
                  Navigator.of(context).pushNamed(JoinRoomScreen.routeName);
                },
                text: "Join Room")
          ],
        ),
      ),
    );
  }
}
