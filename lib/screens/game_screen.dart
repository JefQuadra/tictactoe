import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/listeners/room_data.dart';

class GameScreen extends StatefulWidget {
  static String routename = "/game";
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

final RoomData roomData = RoomData();

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: roomData,
        builder: (BuildContext context, Widget? child) {
          return Center(
            child: Text(Provider.of<RoomData>(context, listen: false).roomData.toString())
            // child: Text(roomData.roomData.toString()),
          );
        },
      )
    );
  }
}
