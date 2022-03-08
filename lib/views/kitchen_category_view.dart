import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/viewmodels/app_provider.dart';
import 'package:smart_home_app/random/app_style.dart';
import 'package:smart_home_app/views/pick_color.dart';
import 'package:smart_home_app/widgets/air_conditioning_card.dart';
import 'package:smart_home_app/widgets/environmental_card.dart';
import 'package:smart_home_app/viewmodels/category_selection_view_model.dart';

class KitchenCategoryView extends StatelessWidget {
  const KitchenCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    return Column(
      children: [
        EnvironmentalCard(
          leadingIcon: Icons.device_thermostat,
          title: AppText.temperatureHumidity,
          trailingIcon: const Icon(
            Icons.battery_full,
            color: Colors.blue,
          ),
          subTile: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.thermostat,
                          color: Colors.grey,
                        ),
                        AppSize.spacedWidth(5),
                        const Text(
                          '29*',
                          style: AppStyle.numberOnCard,
                        ),
                      ],
                    ),
                    AppSize.spacedWidth(15),
                    Row(
                      children: [
                        const Icon(
                          Icons.water,
                          color: Colors.grey,
                        ),
                        AppSize.spacedWidth(5),
                        const Text(
                          '72%',
                          style: AppStyle.numberOnCard,
                        )
                      ],
                    ),
                  ],
                ),
                Chip(
                  label: Text(Category.kitchen.text),
                  backgroundColor: Colors.grey[200],
                )
              ],
            ),
          ),
        ),
        AppSize.spacedHeight(12),
        EnvironmentalCard(
          leadingIcon: Icons.lightbulb,
          title: AppText.bed,
          trailingIcon: //ToggleButtons(children: children, isSelected: isSelected)
              GestureDetector(
            onTap: () => provider.updatebedBulbMode(),
            child: Icon(
                (provider.bedBulbMode)
                    ? Icons.toggle_on_rounded
                    : Icons.toggle_off_rounded,
                size: 60,
                color: (provider.bedBulbMode) ? Colors.blue : Colors.grey[300]),
          ),
          subTile: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      AppText.colour,
                      style: AppStyle.blackTileTitle.copyWith(fontSize: 14),
                    ),
                    AppSize.spacedWidth(5),
                    //! ColorPicker
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PickColor())),
                      child: const CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.yellow,
                      ),
                    )
                  ],
                ),
                Chip(
                  label: Text(Category.kitchen.text),
                  backgroundColor: Colors.grey[200],
                )
              ],
            ),
          ),
        ),
        AppSize.spacedHeight(12),
        AirConditioningCard(),
        //AppSize.spacedHeight(2),
        ElevatedButton(
          onPressed: () {},
          child: const Text(AppText.customiseHomePage),
          style: ElevatedButton.styleFrom(
              minimumSize: Size(AppSize.appWidth(context, 0.45), 45),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
        )
      ],
    );
  }
  //! OpA 0786040470
}
