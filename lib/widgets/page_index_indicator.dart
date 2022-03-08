import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/viewmodels/app_provider.dart';
import 'package:smart_home_app/random/app_style.dart';

class Indicator extends StatelessWidget {
  const Indicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppSize.spacedHeight(20),
        Container(
            height: 5,
            width: context.read<AppProvider>().infoCardIndex == 0 ? 15 : 5,
            decoration: BoxDecoration(
                color: context.read<AppProvider>().infoCardIndex == 0
                    ? Colors.grey
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(20))),
        AppSize.spacedWidth(10),
        Container(
            height: 5,
            width: context.read<AppProvider>().infoCardIndex == 1 ? 15 : 5,
            decoration: BoxDecoration(
                color: context.read<AppProvider>().infoCardIndex == 1
                    ? Colors.grey
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(20))),
        AppSize.spacedWidth(10),
        Container(
            height: 5,
            width: context.read<AppProvider>().infoCardIndex == 2 ? 15 : 5,
            decoration: BoxDecoration(
                color: context.read<AppProvider>().infoCardIndex == 2
                    ? Colors.grey
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(20))),
      ],
    );
  }
}
