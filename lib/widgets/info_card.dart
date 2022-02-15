import 'package:flutter/material.dart';
import 'package:smart_home_app/random/app_style.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.appHeight(context, 0.2),
      width: double.infinity,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppStyle.redColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppText.energyUsage, style: AppStyle.whiteBold),
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.more_horiz_rounded,
                  size: 16,
                  color: AppStyle.redColor,
                ),
              )
            ],
          ),
          const Divider(
            thickness: 1.1,
            color: Colors.white24,
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppText.today,
                    style: AppStyle.whiteNormal,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(Icons.arrow_upward, color: Colors.white),
                      Text(
                        '${AppNumeric.dailyEnergy.toString()} kWh',
                        style: AppStyle.whiteBold,
                      )
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    AppText.thisMonth,
                    style: AppStyle.whiteNormal,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_upward,
                        color: Colors.white,
                      ),
                      Text(
                        '${AppNumeric.monthlyEnergy.toString()} kWh',
                        style: AppStyle.whiteBold,
                      )
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
