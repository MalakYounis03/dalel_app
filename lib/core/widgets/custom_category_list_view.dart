import 'package:dalel_app/core/model/data_model.dart';
import 'package:dalel_app/core/widgets/custom_category_list_view_item.dart';
import 'package:flutter/material.dart';

class CustomCategoryListView extends StatelessWidget {
  const CustomCategoryListView({
    super.key,
    required this.dataList,
    required this.routePath,
  });
  final List<DataModel> dataList;
  final String routePath;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 133,
      child: ListView.separated(
        clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return const SizedBox(width: 16);
        },
        scrollDirection: Axis.horizontal,
        itemCount: dataList.length,
        itemBuilder: (_, index) {
          return CustomCategoryListViewItem(
            model: dataList[index],
            routePath: routePath,
          );
        },
      ),
    );
  }
}
