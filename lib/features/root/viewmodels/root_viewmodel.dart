import 'package:flutter/material.dart';

// Encapsulation
class RootViewModel extends ChangeNotifier {
  int _currentPageIndex = 0;

  int get currentPageIndex => _currentPageIndex;

  void onPageChanged(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }
}
