import 'package:flutter/material.dart';

enum Category { favorites, kitchen, livingRoom, bedroom }

extension CategoryExtension on Category {
  String get value {
    switch (this) {
      case Category.favorites:
        return 'Favorites';
      case Category.kitchen:
        return 'Kitchen';
      case Category.livingRoom:
        return 'Living Room';
      case Category.bedroom:
        return 'Bedroom';
    }
  }
}

class HomeViewModel extends ChangeNotifier {
  Category _selectedCategory = Category.favorites;
  Category get selectedCategory => _selectedCategory;

  int _selectedInfo = 0;
  int get selectedInfo => _selectedInfo;

  final List<String> _favouriteItems = [];
  List<String> get favouriteItems => _favouriteItems;

  void onCategorySelected(Category category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void onInfoSelected(int info) {
    _selectedInfo = info;
    notifyListeners();
  }
}
