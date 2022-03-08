import 'package:flutter/widgets.dart';

class BottomNavigationViewModel extends ChangeNotifier {
  int _navigationIndex = 0;
  int get navigationIndex => _navigationIndex;
  void setNavigationIndex(int index) {
    _navigationIndex = index;
    notifyListeners();
  }
}
