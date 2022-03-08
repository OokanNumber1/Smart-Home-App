import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/viewmodels/app_provider.dart';
import 'package:smart_home_app/viewmodels/bottom_navigation_view_model.dart';
import 'package:smart_home_app/viewmodels/category_selection_view_model.dart';
import 'package:smart_home_app/views/root_app_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavigationViewModel()),
        ChangeNotifierProvider(create: (_) => CategorySelectionViewModel()),
      ],
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RootAppView(),
      ),
    );
  }
}
