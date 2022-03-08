import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/viewmodels/category_selection_view_model.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Consumer<CategorySelectionViewModel>(
          builder: (context, value, child) {
        return ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 0),
          scrollDirection: Axis.horizontal,
          itemCount: value.categoryList.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              {
                context
                    .read<CategorySelectionViewModel>()
                    .onSelectedCategory(value.categoryList[index]);
              }
            },
            child: Chip(
              padding: const EdgeInsets.all(12),
              label: Text(
                value.categoryList[index].text,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: (value.categoryList[index] == value.selectedCategory)
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
        );
      }),
    );
  }
}
