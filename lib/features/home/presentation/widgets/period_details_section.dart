import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_header_text.dart';
import 'package:dalel_app/features/home/presentation/widgets/read_more_text.dart';
import 'package:flutter/material.dart';

class PeriodDetailsSection extends StatelessWidget {
  const PeriodDetailsSection({
    super.key,
    required this.periodName,
    required this.description,
    required this.imageUrl,
  });
  final String periodName;
  final String description;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomHeaderText(text: "${AppStrings.about} $periodName"),
            const SizedBox(width: 7),
            Image.asset(Assets.imagesVictor2),
          ],
        ),
        const SizedBox(height: 47),
        Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(top: -24, child: Image.asset(Assets.imagesVictor4)),
                SizedBox(
                  width: 196,
                  height: 203,
                  child: SingleChildScrollView(
                    child: CustomReadMoreText(text: description, trimLines: 7),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: 131,
              height: 203,
              child: CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover),
            ),
          ],
        ),
      ],
    );
  }
}
