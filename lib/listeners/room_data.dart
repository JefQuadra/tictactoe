import 'dart:async';

import 'package:flutter/material.dart';

class RoomData extends ChangeNotifier {
  Map<String, dynamic> _roomData = {};
  Map<String, dynamic> get roomData => _roomData;

  void updateRoomData(Map<String, dynamic> data) {
    print("eSTÁ CHEGANDO ${data}");
    _roomData = data;
    print("Passouuu ${_roomData}");
      notifyListeners();
  }
}
