import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

class IHaveAgreeWidget extends StatelessWidget {
  const IHaveAgreeWidget({super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: text1, style: CustomTextStyles.poppins400style12),
              TextSpan(
                text: text2,
                style: CustomTextStyles.poppins400style12.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
