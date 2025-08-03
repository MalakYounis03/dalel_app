import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/custom_btn.dart';
import 'package:dalel_app/features/onBoarding/presentation/views/widgets/on_boarding_widget_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

final PageController _controller = PageController(initialPage: 0);

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(height: 40,),
              customNavBar(),
              OnBoardingWidgetBody(controller: _controller),
              SizedBox(height: 88,),
              CustomBtn(
                color: AppColors.deepBrown,
                onPressed: ,
                text: AppStrings.next ,
              ),
              SizedBox(height: 17,)
            ],
          ),
        ),
      ),
    );
  }

  Text customNavBar() {
    return Text(AppStrings.skip,
              style: CustomTextStyles.poppins300style16.copyWith(
                fontWeight: FontWeight.w400,
              ),
            );
  }
}
