import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  bool bedBulbMode = false;
  bool airConditionMode = true;
  double acValue = 22;

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
}
