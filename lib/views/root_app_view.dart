import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/viewmodels/bottom_navigation_view_model.dart';
import 'package:smart_home_app/views/home_view.dart';
import 'package:smart_home_app/views/schedule_view.dart';
import 'package:smart_home_app/widgets/bottom_app_item.dart';

class RootAppView extends StatelessWidget {
  const RootAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomeView(),
      const ScheduleView(),
      const SizedBox(),
      const SizedBox(),
    ];
    return Scaffold(
      body: pages[context.watch<BottomNavigationViewModel>().navigationIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.white,
            ),
            child: const Icon(
              Icons.add,
              size: 16,
              color: Colors.blue,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        shape: const CircularNotchedRectangle(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: 55,
          child: Row(
            children: [
              BottomAppItem(
                icon: Icons.home_rounded,
                label: 'Home',
                onTouchDown: () {
                  context
                      .read<BottomNavigationViewModel>()
                      .setNavigationIndex(0);
                },
                active:
                    context.read<BottomNavigationViewModel>().navigationIndex ==
                            0
                        ? true
                        : false,
              ),
              const Spacer(),
              BottomAppItem(
                icon: Icons.schedule,
                label: 'Schedule',
                onTouchDown: () {
                  context
                      .read<BottomNavigationViewModel>()
                      .setNavigationIndex(1);
                },
                active:
                    context.read<BottomNavigationViewModel>().navigationIndex ==
                            1
                        ? true
                        : false,
              ),
              const Spacer(flex: 2),
              BottomAppItem(
                icon: Icons.text_snippet,
                label: 'Scripts',
                onTouchDown: () {
                  context
                      .read<BottomNavigationViewModel>()
                      .setNavigationIndex(2);
                },
                active:
                    context.read<BottomNavigationViewModel>().navigationIndex ==
                            2
                        ? true
                        : false,
              ),
              const Spacer(),
              BottomAppItem(
                icon: Icons.settings,
                label: 'Settings',
                onTouchDown: () {
                  context
                      .read<BottomNavigationViewModel>()
                      .setNavigationIndex(3);
                },
                active:
                    context.read<BottomNavigationViewModel>().navigationIndex ==
                            3
                        ? true
                        : false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
