import 'package:dalel_app/core/functions/navigation.dart';
import 'package:dalel_app/core/model/data_model.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomCategoryListViewItem extends StatelessWidget {
  const CustomCategoryListViewItem({
    super.key,
    required this.model,
    required this.routePath,
  });
  final DataModel model;
  final String routePath;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customNavigate(context, routePath);
      },
      child: Container(
        width: 74,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey,
              blurRadius: 10,
              offset: const Offset(0, 7),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 74,
              height: 96,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(model.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 11),
            Text(model.name, style: CustomTextStyles.poppins500style14),
          ],
        ),
      ),
    );
  }
}
