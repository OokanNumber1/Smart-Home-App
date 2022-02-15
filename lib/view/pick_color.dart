import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/provider/app_provider.dart';
import 'package:smart_home_app/random/app_style.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class PickColor extends StatelessWidget {
  const PickColor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    Color currentColor = Colors.amber;
    List<Color> currentColors = [Colors.yellow, Colors.green];
    List<Color> colorHistory = [];

    void changeColor(Color color) {
      //setState(() =>
      currentColor = color;
      //);
    }

    void changeColors(List<Color> colors) {
      //setState(() =>
      currentColors = colors;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Transform.scale(
            scale: 0.6,
            child: CircleAvatar(
              //radius: 5,
              backgroundColor: Colors.grey[200],
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              AppText.bed,
              style: AppStyle.black20,
            ),
            AppSize.spacedHeight(3),
            Text(
              AppText.consumes1kWh,
              style: AppStyle.whiteNormal.copyWith(color: Colors.black),
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
                      child: Icon(
                        Icons.favorite,
                        color: Colors.grey,
                      ))))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              provider.updatebedBulbMode();
            },
            //
            child: Icon(
                provider.bedBulbMode ? Icons.toggle_on : Icons.toggle_off,
                size: 60,
                color: provider.bedBulbMode ? Colors.blue : Colors.grey),
          ),

          /*
          HSVColorPickerExample(
            pickerColor: currentColor,
            onColorChanged: changeColor,
            colorHistory: colorHistory,
            onHistoryChanged: (List<Color> colors) => colorHistory = colors,
          ),
          MaterialColorPickerExample(
              pickerColor: currentColor, onColorChanged: changeColor),
          BlockColorPickerExample(
            pickerColor: currentColor,
            onColorChanged: changeColor,
            pickerColors: currentColors,
            onColorsChanged: changeColors,
            colorHistory: colorHistory,
          ),
          */

          ColorPicker(
              pickerColor: Colors.yellow, onColorChanged: (Color color) {})
        ],
      ),
    );
  }
}
