import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:flutter/widgets.dart';
import 'package:readmore/readmore.dart';

class CustomReadMoreText extends StatelessWidget {
  const CustomReadMoreText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView(
        children: [
          ReadMoreText(
            trimLines: 7,
            trimCollapsedText: "Read More",
            trimExpandedText: "...Show Less",
            trimMode: TrimMode.Line,
            moreStyle: CustomTextStyles.poppins500style14,
            lessStyle: CustomTextStyles.poppins500style14,
            text,
            style: CustomTextStyles.poppins300style16.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
