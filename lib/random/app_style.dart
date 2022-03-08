import 'package:flutter/material.dart';
import 'package:smart_home_app/viewmodels/app_provider.dart';

class AppStyle {
  static const redColor = Color(0x4ffE04F7E);
  static const black20 = TextStyle(fontSize: 20, color: Colors.black);
  static const blackTileTitle =
      TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold);

  static const whiteBold =
      TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500);
  static const whiteNormal = TextStyle(
      fontSize: 10, color: Colors.white, fontWeight: FontWeight.normal);
  static const numberOnCard = TextStyle(
      fontSize: 15, color: Colors.blue, fontWeight: FontWeight.normal);
  static const navBarStyle =
      TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
}

class AppText {
  static const name = 'Rakim Mayers';
  static const welcomeText = 'Welcome home,';
  static const energyUsage = 'Energy Usage';
  static const today = 'Today';
  static const thisMonth = 'This Month';
  static const temperatureHumidity = 'Temperature and Humidity';
  static const bed = 'By the Bed';
  static const airConditioning = 'Air Conditioning';
  static const colour = 'Colour';
  static const emptyFavouriteWord =
      "You haven't added anything yet to favourites";
  static const addToFavourites = 'Add to Favourites';
  static const customiseHomePage = 'Customise Home Page';
  static const consumes1kWh = 'Consumes 1kWh';
}

class AppSize {
  static double appHeight(BuildContext context, double heightRatio) =>
      MediaQuery.of(context).size.height * heightRatio;

  static double appWidth(BuildContext context, double widthRatio) =>
      MediaQuery.of(context).size.width * widthRatio;
  static SizedBox spacedHeight(double height) => SizedBox(
        height: height,
      );
  static SizedBox spacedWidth(double width) => SizedBox(
        width: width,
      );
}

class AppNumeric {
  static const dailyEnergy = 30.7;
  static const monthlyEnergy = 235.37;
}
