import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/constants/app_sizes.dart';
import 'package:smart_home_app/constants/app_styles.dart';
import 'package:smart_home_app/constants/app_texts.dart';
import 'package:smart_home_app/provider/app_provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class PickColorView extends StatelessWidget {
  const PickColorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Transform.scale(
            scale: 0.6,
            child: CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: const Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
          ),
        ),
        centerTitle: true,
        title: Column(
          children: [
            const Text(AppTexts.bed, style: AppStyles.black20),
            AppSizes.spacedHeight(3),
            Text(
              AppTexts.consumes1kWh,
              style: AppStyles.whiteNormal.copyWith(color: Colors.black),
            )
          ],
        ),
        actions: [
          GestureDetector(
            child: Transform.scale(
              scale: 0.7,
              child: CircleAvatar(
                //radius: 5,
                backgroundColor: Colors.grey[200],
                child: const Icon(Icons.favorite, color: Colors.grey),
              ),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => provider.updatebedBulbMode(),
            child: Icon(
              provider.bedBulbMode ? Icons.toggle_on : Icons.toggle_off,
              size: 60,
              color: provider.bedBulbMode ? Colors.blue : Colors.grey,
            ),
          ),
          ColorPicker(
            pickerColor: Colors.yellow,
            onColorChanged: (Color color) {},
          )
        ],
      ),
    );
  }
}
