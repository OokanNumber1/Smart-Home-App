import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  Color defCat = Colors.grey;
  bool bedBulbMode = false;
  bool airConditionMode = true;
  double acValue = 22;
  List favouriteItems = [];
  Color bedColor = Colors.yellow;
  int infoCardIndex = 0;

  void updatebedBulbMode() {
    bedBulbMode = !bedBulbMode;
    notifyListeners();
  }

  void updateairConditionMode() {
    airConditionMode = !airConditionMode;
    notifyListeners();
  }

  void sliderChange(double newValue) {
    acValue = newValue;

    notifyListeners();
  }

  void infoCardChange(int index) {
    infoCardIndex = index;
    notifyListeners();
  }
}
