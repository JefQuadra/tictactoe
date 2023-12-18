import 'package:flutter/material.dart';
import 'package:tictactoe/resources/socket_methods.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';

class JoinRoomScreen extends StatefulWidget {
  static String routeName = "/join-room";
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _gameIdController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _socketMethods.joinRoomSuccessListener(context);
    _socketMethods.errorOccuredListener(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _gameIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                  text: "Join Room",
                  fontSize: 70,
                  shadows: [Shadow(blurRadius: 40, color: Colors.blue)]),
              SizedBox(height: _size.height * 0.08),
              CustomTextField(
                  controller: _nameController, hintText: "Enter player name"),
              const SizedBox(height: 20),
              CustomTextField(
                  controller: _gameIdController, hintText: "Game ID"),
              SizedBox(height: _size.height * 0.05),
              CustomButton(onTap: () {}, text: "Join")
            ],
          ),
        ),
      ),
    );
  }
}
