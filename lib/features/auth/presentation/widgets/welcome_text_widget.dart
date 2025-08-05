import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 152, bottom: 16),
      child: Text(
        title,
        style: CustomTextStyles.poppins600style28,
        textAlign: TextAlign.center,
      ),
    );
  }
}
