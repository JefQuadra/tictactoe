import 'package:socket_io_client/socket_io_client.dart';
import 'package:tictactoe/resources/socket_client.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;
  Socket get socketClient => _socketClient;

  void createRoom(String playername) {
    if (playername.isNotEmpty) {
      //emit an event so that server can listen to it
      _socketClient.emit("createRoom", {"playername": playername});
    }
  }
}
