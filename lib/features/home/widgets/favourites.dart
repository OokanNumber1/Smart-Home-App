import 'package:flutter/material.dart';
import 'package:smart_home_app/constants/app_sizes.dart';
import 'package:smart_home_app/constants/app_styles.dart';
import 'package:smart_home_app/constants/app_texts.dart';

class FavouritesView extends StatelessWidget {
  final List<String> favouriteItems;

  const FavouritesView({Key? key, required this.favouriteItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favouriteItems.isEmpty) {
      return SizedBox(
        height: AppSizes.appHeight(context, 0.64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/images/emptyFavourite.png'),
            AppSizes.spacedHeight(25),
            Text(
              AppTexts.emptyFavouriteWord,
              textAlign: TextAlign.center,
              style: AppStyles.blackTileTitle.copyWith(fontSize: 16),
            ),
            AppSizes.spacedHeight(15),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                AppTexts.addToFavourites,
                style: TextStyle(color: Colors.grey[100]),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(AppSizes.appWidth(context, 0.45),
                    AppSizes.appHeight(context, 0.08)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            )
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: Container(height: AppSizes.appHeight(context, 0.8)),
    );
  }
}
