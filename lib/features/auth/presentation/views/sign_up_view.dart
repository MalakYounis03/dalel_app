import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_btn.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_sign_up_form.dart';
import 'package:dalel_app/features/auth/presentation/widgets/have_an_account_widget.dart';
import 'package:dalel_app/features/auth/presentation/widgets/i_have_agree_widget.dart';
import 'package:dalel_app/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: WelcomeTextWidget(title: AppStrings.welcome),
            ),
            SliverToBoxAdapter(
              child: CustomSignUpForm(text: AppStrings.fristName),
            ),
            SliverToBoxAdapter(
              child: CustomSignUpForm(text: AppStrings.lastName),
            ),
            SliverToBoxAdapter(
              child: CustomSignUpForm(text: AppStrings.emailAddress),
            ),
            SliverToBoxAdapter(
              child: CustomSignUpForm(text: AppStrings.password),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),

            SliverToBoxAdapter(
              child: IHaveAgreeWidget(
                text1: AppStrings.iHaveAgreeToOur,
                text2: AppStrings.termsAndCondition,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 70)),
            SliverToBoxAdapter(
              child: CustomBtn(
                color: AppColors.deepBrown,
                onPressed: () {},
                text: AppStrings.signUp,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20)),

            SliverToBoxAdapter(
              child: HaveAnAccountWidget(
                text1: AppStrings.alreadyHaveAnAccount,
                text2: AppStrings.signIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
