import 'package:flutter/material.dart';
import 'package:smart_home_app/random/app_style.dart';

class BottomAppItem extends StatelessWidget {
  BottomAppItem(
      {required this.icon,
      required this.label,
      required this.onTouchDown,
      this.active});
  IconData icon;
  String label;
  Function onTouchDown;
  bool? active = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTouchDown();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
            color: active! ? Colors.black : Colors.grey,
          ),
          Text(
            label,
            style: AppStyle.navBarStyle.copyWith(
              color: active! ? Colors.black : Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
