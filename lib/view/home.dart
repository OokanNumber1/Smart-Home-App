import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/provider/app_provider.dart';
import 'package:smart_home_app/random/app_style.dart';
import 'package:smart_home_app/view/kitchen.dart';
import 'package:smart_home_app/widgets/air_conditioning_card.dart';
import 'package:smart_home_app/widgets/bottom_app_item.dart';
import 'package:smart_home_app/widgets/environmental_card.dart';
import 'package:smart_home_app/widgets/info_card.dart';
import 'package:smart_home_app/widgets/page_index_indicator.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            AppText.welcomeText + AppText.name,
            style: AppStyle.black20,
            maxLines: 2,
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/profile.jpg')),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                OrientationBuilder(
                  builder: (context, orientation) => Container(
                    height: orientation == Orientation.portrait
                        ? AppSize.appHeight(context, 0.2)
                        : AppSize.appHeight(context, 0.1),
                    child: PageView(
                      onPageChanged: (value) =>
                          context.read<AppProvider>().infoCardChange(value),
                      scrollDirection: Axis.horizontal,
                      //controller: PageController(),
                      children: [
                        InfoCard(),
                        Container(
                          height: AppSize.appHeight(context, 0.2),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Container(
                          height: AppSize.appHeight(context, 0.2),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(20)),
                        )
                      ],
                    ),
                  ),
                ),
                const Indicator(),
                Container(
                  height: 60,
                  child: ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(left: 0),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              {
                                provider.setSelectedCategory(
                                    categoryList[index].enumCategory);
                                provider
                                    .setCategoryPage(categoryList[index].page);
                              }
                            },
                            child: Chip(
                              padding: const EdgeInsets.all(12),
                              label: Text(
                                categoryList[index].labelCategory,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: (provider.selectedCategory
                                                .enumCategory ==
                                            categoryList[index].enumCategory)
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
                      itemCount: categoryList.length),
                ),
                AppSize.spacedHeight(12),
                provider.selectedCategory.page,
              ],
            ),
          ),
        ));
  }
  /*
        OrientationBuilder(
            builder: (context, orientation) =>
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? PortraitHome(provider: provider)
                    : LandScapeHome(provider: provider))

        /*bottomNavigationBar: Container(
        decoration: BoxDecoration(
          shape: CircularNotchedRectangle
        ),
        //currentIndex: provider.currentIndex,
        child: Row(
        children: [
           Icon(Icons.home),// label: 'Home'),
          Icon(Icons.schedule), //label: 'Schedule'),
          Icon(Icons.home),// label: 'Home')
        ],)
      ),*/
        );
  }
}

class PortraitHome extends StatelessWidget {
  const PortraitHome({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final AppProvider provider;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            const InfoCard(),
            const Icon(Icons.more_horiz_rounded),
            Container(
              height: 60,
              child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 0),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          {
                            provider.setSelectedCategory(
                                categoryList[index].enumCategory);
                            provider.setCategoryPage(categoryList[index].page);
                          }
                        },
                        child: Chip(
                          padding: const EdgeInsets.all(12),
                          label: Text(
                            categoryList[index].labelCategory,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color:
                                    (provider.selectedCategory.enumCategory ==
                                            categoryList[index].enumCategory)
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
                  itemCount: categoryList.length),
            ),
            AppSize.spacedHeight(12),
            provider.selectedCategory.page,
          ],
        ),
      ),
    );
  }
}

class LandScapeHome extends StatelessWidget {
  const LandScapeHome({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final AppProvider provider;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            const InfoCard(),
            const Icon(Icons.more_horiz_rounded),
            Container(
              height: 60,
              child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 0),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          {
                            provider.setSelectedCategory(
                                categoryList[index].enumCategory);
                            provider.setCategoryPage(categoryList[index].page);
                          }
                        },
                        child: Chip(
                          padding: const EdgeInsets.all(12),
                          label: Text(
                            categoryList[index].labelCategory,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color:
                                    (provider.selectedCategory.enumCategory ==
                                            categoryList[index].enumCategory)
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
                  itemCount: categoryList.length),
            ),
            AppSize.spacedHeight(12),
            provider.selectedCategory.page,
          ],
        ),
      ),
    );
  }

*/
}
