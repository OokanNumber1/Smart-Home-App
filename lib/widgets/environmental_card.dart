import 'package:flutter/material.dart';
import 'package:smart_home_app/random/app_style.dart';

class EnvironmentalCard extends StatelessWidget {
  //const EnvironmentalCard({Key? key}) : super(key: key);
  EnvironmentalCard(
      {required this.leadingIcon,
      required this.title,
      required this.subTile,
      required this.trailingIcon});
  IconData leadingIcon;
  String title;
  Widget trailingIcon;
  Widget subTile;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.appHeight(context, 0.18),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.white),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.blueGrey[200],
                child: Icon(leadingIcon)),
            title: Text(
              title,
              style: AppStyle.blackTileTitle,
            ),
            trailing: trailingIcon,
          ),
          subTile
        ],
      ),
    );
  }
}
