import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:tictactoe/listeners/room_data.dart';
import 'package:tictactoe/resources/socket_client.dart';
import 'package:tictactoe/screens/game_screen.dart';

final RoomData roomData = RoomData();

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;
  Socket get socketClient => _socketClient;

  void createRoom(String playername) {
    if (playername.isNotEmpty) {
      //emit an event so that server can listen to it
      _socketClient.emit("createRoom", {"playername": playername});
    }
  }

  void createRoomSucessListener(BuildContext context) {
    _socketClient.on("createRoomSucess", (room) {
      print("ROOM ${room}");
      Provider.of<RoomData>(context, listen: false).updateRoomData(room);
      Navigator.of(context).pushNamed(GameScreen.routename);
    });
  }

  void joinRoom(String playerName, String roomId) {
    if (playerName.isNotEmpty && roomId.isNotEmpty) {
      _socketClient
          .emit("joinRoom", {"playerName": playerName, "roomId": roomId});
    }
  }

  void joinRoomSuccessListener(BuildContext context) {
    print("foi");
    _socketClient.on("joinRoomSuccess", (room) {
      Provider.of<RoomData>(context, listen: false).updateRoomData(room);
      Navigator.of(context).pushNamed(GameScreen.routename);
    });
  }

  void errorOccuredListener(BuildContext context) {
    _socketClient.on("erroOcurred", (data) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data)));
    });
  }
}
