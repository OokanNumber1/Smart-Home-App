import 'package:flutter/material.dart';
import 'package:smart_home_app/constants/app_sizes.dart';
import 'package:smart_home_app/constants/app_styles.dart';

class EnvironmentalCard extends StatelessWidget {
  const EnvironmentalCard({
    Key? key,
    required this.leadingIcon,
    required this.title,
    required this.subTile,
    required this.trailingIcon,
  }) : super(key: key);

  final IconData leadingIcon;
  final String title;
  final Widget trailingIcon;
  final Widget subTile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.appHeight(context, 0.18),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.blueGrey[200],
                child: Icon(leadingIcon)),
            title: Text(
              title,
              style: AppStyles.blackTileTitle,
            ),
            trailing: trailingIcon,
          ),
          subTile
        ],
      ),
    );
  }
}
