import 'package:dalel_app/core/dataBase/cache/cache_helper.dart';
import 'package:dalel_app/core/functions/navigation.dart';
import 'package:dalel_app/core/service/service_licator.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_btn.dart';
import 'package:dalel_app/features/onBoarding/data/models/on_boarding_model.dart';
import 'package:dalel_app/features/onBoarding/presentation/views/widgets/custom_nav_bar.dart';
import 'package:dalel_app/features/onBoarding/presentation/views/widgets/on_boarding_widget_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

final PageController _controller = PageController(initialPage: 0);
int currentIndex = 0;

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
              SizedBox(height: 40),
              CustomNavBar(
                onTap: () {
                  getIt<CacheHelper>().saveData(
                    key: "isOnBoardingVisited",
                    value: true,
                  );
                  customNavigate(context, "/signUp");
                },
              ),
              OnBoardingWidgetBody(
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                controller: _controller,
              ),
              SizedBox(height: 88),
              currentIndex == onBoardingData.length - 1
                  ? Column(
                      children: [
                        CustomBtn(
                          color: AppColors.deepBrown,
                          onPressed: () {
                            getIt<CacheHelper>().saveData(
                              key: "isOnBoardingVisited",
                              value: true,
                            );
                            customNavigate(context, "/signUp");
                          },
                          text: AppStrings.createAccount,
                        ),
                        SizedBox(height: 16),
                        GestureDetector(
                          child: Text(AppStrings.loginNow),
                          onTap: () {
                            getIt<CacheHelper>().saveData(
                              key: "isOnBoardingVisited",
                              value: true,
                            );
                            customNavigate(context, "/signIn");
                          },
                        ),
                      ],
                    )
                  : CustomBtn(
                      color: AppColors.deepBrown,
                      onPressed: () {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.bounceIn,
                        );
                      },
                      text: AppStrings.next,
                    ),
              SizedBox(height: 17),
            ],
          ),
        ),
      ),
    );
  }
}
