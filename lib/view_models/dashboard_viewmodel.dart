import 'package:flutter/material.dart';

class DashBoardViewModel with ChangeNotifier {
  int selectedIndex = 0;

  void onTapItem(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
