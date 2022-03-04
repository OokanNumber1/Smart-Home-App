import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/constants/app_sizes.dart';
import 'package:smart_home_app/constants/app_styles.dart';
import 'package:smart_home_app/constants/app_texts.dart';
import 'package:smart_home_app/features/home/viewmodels/home_viewmodel.dart';
import 'package:smart_home_app/provider/app_provider.dart';
import 'package:smart_home_app/features/home/widgets/pick_color_view.dart';
import 'package:smart_home_app/widgets/air_conditioning_card.dart';
import 'package:smart_home_app/widgets/environmental_card.dart';

class KitchenCategory extends StatelessWidget {
  const KitchenCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    return Column(
      children: [
        EnvironmentalCard(
          leadingIcon: Icons.device_thermostat,
          title: AppTexts.temperatureHumidity,
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
                        const Icon(Icons.thermostat, color: Colors.grey),
                        AppSizes.spacedWidth(5),
                        const Text('29*', style: AppStyles.numberOnCard),
                      ],
                    ),
                    AppSizes.spacedWidth(15),
                    Row(
                      children: [
                        const Icon(Icons.water, color: Colors.grey),
                        AppSizes.spacedWidth(5),
                        const Text('72%', style: AppStyles.numberOnCard)
                      ],
                    ),
                  ],
                ),
                Chip(
                  label: Text(Category.kitchen.name),
                  backgroundColor: Colors.grey[200],
                )
              ],
            ),
          ),
        ),
        AppSizes.spacedHeight(12),
        EnvironmentalCard(
          leadingIcon: Icons.lightbulb,
          title: AppTexts.bed,
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
                      AppTexts.colour,
                      style: AppStyles.blackTileTitle.copyWith(fontSize: 14),
                    ),
                    AppSizes.spacedWidth(5),
                    //! ColorPicker
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PickColorView()),
                      ),
                      child: const CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.yellow,
                      ),
                    )
                  ],
                ),
                Chip(
                  label: Text(Category.kitchen.name),
                  backgroundColor: Colors.grey[200],
                )
              ],
            ),
          ),
        ),
        AppSizes.spacedHeight(12),
        const AirConditioningCard(),
        ElevatedButton(
          onPressed: () {},
          child: const Text(AppTexts.customiseHomePage),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(AppSizes.appWidth(context, 0.45), 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        )
      ],
    );
  }
}
