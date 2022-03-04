import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/constants/app_sizes.dart';
import 'package:smart_home_app/constants/app_styles.dart';
import 'package:smart_home_app/constants/app_texts.dart';
import 'package:smart_home_app/features/home/viewmodels/home_viewmodel.dart';
import 'package:smart_home_app/features/home/widgets/favourites.dart';
import 'package:smart_home_app/features/home/widgets/info_card.dart';
import 'package:smart_home_app/widgets/page_index_indicator.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        title: const Text(
          AppTexts.welcomeText + 'Rakim Mayers',
          style: AppStyles.black20,
          maxLines: 2,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Consumer<HomeViewModel>(
            builder: (context, value, child) => Column(
              children: [
                SizedBox(
                  height: AppSizes.appHeight(context, 0.15),
                  child: PageView(
                    onPageChanged: value.onInfoSelected,
                    scrollDirection: Axis.horizontal,
                    children: [
                      const InfoCard(),
                      ...List.generate(
                        2,
                        (index) => Container(
                          height: AppSizes.appHeight(context, 0.2),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AppSizes.spacedHeight(12),
                Indicator(currentIndex: value.selectedInfo),
                Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: ListView.separated(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(left: 0),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            value.onCategorySelected(Category.values[index]);
                          },
                          child: Chip(
                            padding: const EdgeInsets.all(12),
                            label: Text(
                              Category.values[index].value,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: (value.selectedCategory ==
                                          Category.values[index])
                                      ? Colors.black
                                      : Colors.grey),
                            ),
                            backgroundColor: Colors.white,
                            elevation: 1,
                          ),
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 15,
                        ),
                        itemCount: Category.values.length,
                      ),
                    ),
                    AppSizes.spacedHeight(12),
                    [
                      FavouritesView(favouriteItems: value.favouriteItems),
                      const SizedBox(),
                      const SizedBox(),
                      const SizedBox(),
                    ][value.selectedCategory.index]
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
