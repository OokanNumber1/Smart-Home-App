import 'package:flutter/material.dart';
import 'package:smart_home_app/constants/app_styles.dart';

// Your widgets should be immutable
class BottomAppItem extends StatelessWidget {
  const BottomAppItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTouchDown,
    this.active = false,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final Function()? onTouchDown;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTouchDown,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 24,
            color: active ? Colors.black : Colors.grey,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppStyles.navBarStyle.copyWith(
              color: active ? Colors.black : Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
