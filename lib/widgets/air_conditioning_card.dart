import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/constants/app_sizes.dart';
import 'package:smart_home_app/constants/app_styles.dart';
import 'package:smart_home_app/constants/app_texts.dart';
import 'package:smart_home_app/features/home/viewmodels/home_viewmodel.dart';
import 'package:smart_home_app/provider/app_provider.dart';

class AirConditioningCard extends StatelessWidget {
  const AirConditioningCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    return Container(
      height: AppSizes.appHeight(context, 0.254),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.white),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.blueGrey[200],
                child: const Icon(
                  Icons.air_rounded,
                )),
            title: const Text(
              AppTexts.airConditioning,
              style: AppStyles.blackTileTitle,
            ),
            trailing: GestureDetector(
              onTap: () => provider.updateairConditionMode(),
              child: Icon(
                  (provider.airConditionMode)
                      ? Icons.toggle_on_rounded
                      : Icons.toggle_off_rounded,
                  size: 60,
                  color: (provider.airConditionMode)
                      ? Colors.blue
                      : Colors.grey[300]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                Slider(
                  value: provider.acValue,
                  min: 14,
                  max: 30,
                  divisions: 4,
                  label: provider.acValue.toString(),
                  onChanged: (value) => provider.sliderChange(value),
                  activeColor: Colors.blue[200],
                  inactiveColor: Colors.grey[200],
                  thumbColor: Colors.blueGrey,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            Icons.wb_sunny_outlined,
                            color: Colors.grey,
                          ),
                          AppSizes.spacedWidth(10),
                          const Icon(Icons.control_point_duplicate_sharp,
                              color: Colors.grey),
                          AppSizes.spacedWidth(10),
                          const Icon(Icons.water, color: Colors.grey)
                        ],
                      ),
                      Chip(
                        label: Text(Category.kitchen.name),
                        backgroundColor: Colors.grey[200],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
