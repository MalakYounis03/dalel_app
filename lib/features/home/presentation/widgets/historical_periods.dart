import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HistoricalPeriodsItem(asset: Assets.imagesHome1, text: "Ancient Egypt"),
        HistoricalPeriodsItem(asset: Assets.imagesHome2, text: "Islamic Era "),
      ],
    );
  }
}

class HistoricalPeriodsItem extends StatelessWidget {
  const HistoricalPeriodsItem({
    super.key,
    required this.asset,
    required this.text,
  });
  final String asset;
  final String text;
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
              text,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: CustomTextStyles.poppins500style18.copyWith(
                fontSize: 16,
                color: AppColors.deepBrown,
              ),
            ),
          ),
          Container(
            height: 64,
            width: 47,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(asset)),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
