import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/features/home/viewmodels/home_viewmodel.dart';
import 'package:smart_home_app/features/root/viewmodels/root_viewmodel.dart';
import 'package:smart_home_app/provider/app_provider.dart';
import 'package:smart_home_app/features/root/views/root_view.dart';

void main() {
  runApp(const SmartHomeApp());
}

class SmartHomeApp extends StatelessWidget {
  const SmartHomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppProvider>(create: (_) => AppProvider()),
        ChangeNotifierProvider<RootViewModel>(create: (_) => RootViewModel()),
        ChangeNotifierProvider<HomeViewModel>(create: (_) => HomeViewModel()),
      ],
      child: const MaterialApp(
        title: 'Smart Home App',
        debugShowCheckedModeBanner: false,
        home: RootView(),
      ),
    );
  }
}
