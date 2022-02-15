import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/provider/app_provider.dart';
import 'package:smart_home_app/view/home.dart';
import 'package:smart_home_app/view/schedule.dart';
import 'package:smart_home_app/widgets/bottom_app_item.dart';

void main() {
  runApp(ChangeNotifierProvider<AppProvider>(
    create: (_) => AppProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyRoot(),
    ),
  ));
}

class MyRoot extends StatefulWidget {
  const MyRoot({Key? key}) : super(key: key);

  @override
  State<MyRoot> createState() => _MyRootState();
}

class _MyRootState extends State<MyRoot> {
  final pages = [Home(), Schedule(), Container(), Container()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[context.read<AppProvider>().currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.white,
            ),
            child: Icon(
              Icons.add,
              size: 16,
              color: Colors.blue,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        //elevation: 5,
        notchMargin: 10,
        shape: CircularNotchedRectangle(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomAppItem(
                icon: Icons.home_rounded,
                label: 'Home',
                onTouchDown: () {
                  context.read<AppProvider>().currentIndex = 0;
                  print({context.read<AppProvider>().currentIndex});
                  print({pages[context.read<AppProvider>().currentIndex]});
                  setState(() {});
                },
                active: context.read<AppProvider>().currentIndex == 0
                    ? true
                    : false,
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Home())),
              ),
              BottomAppItem(
                icon: Icons.schedule,
                label: 'Schedule',
                onTouchDown: () {
                  context.read<AppProvider>().currentIndex = 1;
                  // print({context.read<AppProvider>().currentIndex});
                  // print({pages[context.read<AppProvider>().currentIndex]});
                  setState(() {});
                },
                active: context.read<AppProvider>().currentIndex == 1
                    ? true
                    : false,
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Schedule())),
              ),
              BottomAppItem(
                icon: Icons.text_snippet,
                label: 'Scripts',
                onTouchDown: () {
                  context.read<AppProvider>().currentIndex = 2;
                  // print({context.read<AppProvider>().currentIndex});
                  // print({pages[context.read<AppProvider>().currentIndex]});
                  setState(() {});
                },
                active: context.read<AppProvider>().currentIndex == 2
                    ? true
                    : false,
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Scaffold())),
              ),
              BottomAppItem(
                icon: Icons.settings,
                label: 'Settings',
                onTouchDown: () {
                  context.read<AppProvider>().currentIndex = 3;
                  //print({context.read<AppProvider>().currentIndex});
                  //print({pages[context.watch<AppProvider>().currentIndex]});
                  setState(() {});
                },
                active: context.read<AppProvider>().currentIndex == 3
                    ? true
                    : false,
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Scaffold())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
