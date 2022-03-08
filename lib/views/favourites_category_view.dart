import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/viewmodels/app_provider.dart';
import 'package:smart_home_app/random/app_style.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<AppProvider>(context).favouriteItems;
    if (favouriteProvider.isEmpty) {
      return SizedBox(
        height: AppSize.appHeight(context, 0.64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/emptyFavourite.png',
            ),
            AppSize.spacedHeight(25),
            Text(
              AppText.emptyFavouriteWord,
              textAlign: TextAlign.center,
              style: AppStyle.blackTileTitle.copyWith(fontSize: 16),
            ),
            AppSize.spacedHeight(15),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                AppText.addToFavourites,
                style: TextStyle(color: Colors.grey[100]),
              ),
              style: ElevatedButton.styleFrom(
                  //padding: EdgeInsets.all(15),
                  minimumSize: Size(AppSize.appWidth(context, 0.45),
                      AppSize.appHeight(context, 0.08)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
            )
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: Container(
        height: AppSize.appHeight(context, 0.8),
      ),
    );
  }
}
