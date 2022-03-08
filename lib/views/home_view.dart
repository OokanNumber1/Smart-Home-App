import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/viewmodels/app_provider.dart';
import 'package:smart_home_app/viewmodels/category_selection_view_model.dart';
import 'package:smart_home_app/random/app_style.dart';
import 'package:smart_home_app/views/favourites_category_view.dart';
import 'package:smart_home_app/views/kitchen_category_view.dart';
import 'package:smart_home_app/widgets/category_chip.dart';
import 'package:smart_home_app/widgets/info_card.dart';
import 'package:smart_home_app/widgets/page_index_indicator.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final provider = Provider.of<AppProvider>(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            AppText.welcomeText + AppText.name,
            style: AppStyle.black20,
            maxLines: 2,
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/profile.jpg')),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                OrientationBuilder(
                  builder: (context, orientation) => SizedBox(
                    height: orientation == Orientation.portrait
                        ? AppSize.appHeight(context, 0.2)
                        : AppSize.appHeight(context, 0.1),
                    child: PageView(
                      onPageChanged: (value) =>
                          context.read<AppProvider>().infoCardChange(value),
                      scrollDirection: Axis.horizontal,
                      children: [
                        const InfoCard(),
                        ...List.generate(
                          2,
                          (index) => Container(
                            decoration: BoxDecoration(
                                color: Colors.lightBlue,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Indicator(),
                const CategoryChip(),

                AppSize.spacedHeight(12),
                // provider.selectedCategory.page,
                //context.watch<AppProvider>().selectedCategory.page
                // context.watch<CategorySelectionViewModel>().selectedCategory
                Consumer<CategorySelectionViewModel>(
                  builder: (context, value, child) {
                    switch (value.selectedCategory) {
                      case Category.favourites:
                        return const FavouritesView();
                      case Category.kitchen:
                        return const KitchenCategoryView();
                      case Category.livingroom:
                        return const SizedBox();
                      case Category.bedroom:
                        return const SizedBox();
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}
