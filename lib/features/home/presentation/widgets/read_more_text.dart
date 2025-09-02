import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:flutter/widgets.dart';
import 'package:readmore/readmore.dart';

class CustomReadMoreText extends StatelessWidget {
  const CustomReadMoreText({
    super.key,
    required this.text,
    this.trimLines = 7,
    this.trimCollapsedText = "Read More",
    this.trimExpandedText = " Show Less",
  });

  final String text;
  final int trimLines;
  final String trimCollapsedText;
  final String trimExpandedText;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimLines: trimLines,
      trimCollapsedText: trimCollapsedText,
      trimExpandedText: trimExpandedText,
      trimMode: TrimMode.Line,
      moreStyle: CustomTextStyles.poppins500style14,
      lessStyle: CustomTextStyles.poppins500style14,
      style: CustomTextStyles.poppins300style16.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
