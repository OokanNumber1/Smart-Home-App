import 'package:flutter/material.dart';
import 'package:smart_home_app/features/root/viewmodels/root_viewmodel.dart';
import 'package:smart_home_app/features/home/views/home_view.dart';
import 'package:smart_home_app/features/schedule/views/schedule_view.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/widgets/bottom_app_item.dart';

class RootView extends StatelessWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RootViewModel>(
      builder: (context, value, child) => Scaffold(
        body: [
          const HomeView(),
          const ScheduleView(),
          const SizedBox(),
          const SizedBox(),
        ][value.currentPageIndex],
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.white,
            ),
            child: const Icon(Icons.add, size: 16, color: Colors.blue),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          notchMargin: 8,
          shape: const CircularNotchedRectangle(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            height: kBottomNavigationBarHeight,
            child: Row(
              children: [
                BottomAppItem(
                  icon: Icons.home_rounded,
                  label: 'Home',
                  onTouchDown: () => value.onPageChanged(0),
                  active: value.currentPageIndex == 0 ? true : false,
                ),
                const Spacer(),
                BottomAppItem(
                  icon: Icons.schedule,
                  label: 'Schedule',
                  onTouchDown: () => value.onPageChanged(1),
                  active: value.currentPageIndex == 1 ? true : false,
                ),
                const Spacer(flex: 2),
                BottomAppItem(
                  icon: Icons.text_snippet,
                  label: 'Scripts',
                  onTouchDown: () => value.onPageChanged(2),
                  active: value.currentPageIndex == 2 ? true : false,
                ),
                const Spacer(),
                BottomAppItem(
                  icon: Icons.settings,
                  label: 'Settings',
                  onTouchDown: () => value.onPageChanged(3),
                  active: value.currentPageIndex == 3 ? true : false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
