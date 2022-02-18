import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/view/favourites.dart';
import 'package:smart_home_app/view/home.dart';
import 'package:smart_home_app/view/kitchen.dart';

enum category { Favorites, Kitchen, LivingRoom, Bedroom }

class Category {
  Category(
      {required this.enumCategory,
      required this.labelCategory,
      required this.page});
  category enumCategory;
  String labelCategory;
  Widget page;
}

List<Category> categoryList = [
  Category(
      enumCategory: category.Favorites,
      labelCategory: 'Favourites',
      page: Favourites()),
  Category(
      enumCategory: category.Kitchen,
      labelCategory: 'Kitchen',
      page: KitchenCategory()),
  Category(
      enumCategory: category.LivingRoom,
      labelCategory: 'LivingRoom',
      page: Container()),
  Category(
      enumCategory: category.Bedroom,
      labelCategory: 'Bedroom',
      page: Container()),
];

class BottomNavigation {
  BottomNavigation({required this.index, required this.page});
  int index;
  Widget page;
}

final home = BottomNavigation(index: 0, page: Home());
final schedule = BottomNavigation(index: 1, page: Container());
final scripts = BottomNavigation(index: 2, page: Container());
final settings = BottomNavigation(index: 3, page: Container());

class AppProvider extends ChangeNotifier {
  Color defCat = Colors.grey;
  //category selectedCategory = category.Kitchen;
  final selectedCategory = Category(
      enumCategory: category.Kitchen,
      labelCategory: 'Kitchen',
      page: const KitchenCategory());
  bool bedBulbMode = false;
  bool airConditionMode = true;
  double acValue = 22;
  List favouriteItems = [];
  Color bedColor = Colors.yellow;
  int currentIndex = 0;
  int infoCardIndex = 0;

  void setSelectedCategory(category setTo) {
    selectedCategory.enumCategory = setTo;
    notifyListeners();
  }

  void setCategoryPage(Widget categoryPage) {
    selectedCategory.page = categoryPage;
    notifyListeners();
  }

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
  // List<String> categoryList = [
  //   'Favorites',
  //   'Kitchen',
  //   'Living Room',
  //   'Bedroom'
  // ];
}
