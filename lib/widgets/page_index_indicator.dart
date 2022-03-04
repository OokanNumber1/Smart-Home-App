import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final int currentIndex;
  final int length;

  const Indicator({
    Key? key,
    required this.currentIndex,
    this.length = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 5,
          width: currentIndex == index ? 15 : 5,
          decoration: BoxDecoration(
            color: currentIndex == index ? Colors.grey : Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
