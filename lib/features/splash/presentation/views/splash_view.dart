import 'package:dalel_app/core/dataBase/cache/cache_helper.dart';
import 'package:dalel_app/core/functions/navigation.dart';
import 'package:dalel_app/core/service/service_licator.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool isOnBoardingVisisted =
        getIt<CacheHelper>().getData(key: "isOnBoardingVisited") ?? false;
    if (isOnBoardingVisisted == true) {
      FirebaseAuth.instance.currentUser == null
          ? delayedNavigate(context, "/signIn")
          : FirebaseAuth.instance.currentUser!.emailVerified == true
          ? delayedNavigate(context, "/homeNavBar")
          : delayedNavigate(context, "/signIn");
    } else {
      delayedNavigate(context, "/onBoarding");
    }
    super.initState();
  }

  void delayedNavigate(BuildContext context, path) {
    Future.delayed(Duration(seconds: 2), () {
      customReplacementNavigate(context, path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppStrings.appName,
          style: CustomTextStyles.pacifico400style64,
        ),
      ),
    );
  }
}
