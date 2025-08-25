import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel_app/core/model/data_model.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomDataListViewItem extends StatelessWidget {
  const CustomDataListViewItem({super.key, required this.model});
  final DataModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: 164,
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey,
            blurRadius: 10,
            offset: Offset(0, 7),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: 15),
          SizedBox(
            height: 48,
            width: 62,
            child: Text(
              model.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: CustomTextStyles.poppins500style18.copyWith(
                fontSize: 16,
                color: AppColors.deepBrown,
              ),
            ),
          ),
          SizedBox(
            height: 64,
            width: 47,
            child: CachedNetworkImage(
              imageUrl: model.image,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: AppColors.grey,
                highlightColor: Colors.white,
                child: Container(width: 47, height: 64, color: AppColors.grey),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
