import 'package:dalel_app/core/functions/custom_toast.dart';
import 'package:dalel_app/core/functions/navigation.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_btn.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:dalel_app/features/auth/presentation/widgets/forget_password_text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignInForm extends StatefulWidget {
  const CustomSignInForm({super.key});

  @override
  State<CustomSignInForm> createState() => _CustomSignInFormState();
}

class _CustomSignInFormState extends State<CustomSignInForm> {
  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccessState) {
          FirebaseAuth.instance.currentUser!.emailVerified
              ? customReplacementNavigate(context, "/homeNavBar")
              : showToast("Please Verify Your Account");
        } else if (state is SignInFailureState) {
          showToast(state.errorMessage);
        }
      },

      builder: (context, state) {
        return Form(
          key: authCubit.signInFormKey,

          child: Column(
            children: [
              CustomTextFormField(
                text: AppStrings.emailAddress,
                onChanged: (emailAddress) {
                  authCubit.emailAddress = emailAddress;
                },
              ),
              CustomTextFormField(
                text: AppStrings.password,
                suffixIcon: IconButton(
                  icon: Icon(
                    authCubit.obscurePasswordTextValue == true
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: () {
                    authCubit.obscurePasswordText();
                  },
                ),
                obscureText: authCubit.obscurePasswordTextValue,
                onChanged: (password) {
                  authCubit.password = password;
                },
              ),

              const SizedBox(height: 16),
              const ForgetPasswordTextWidget(),
              const SizedBox(height: 102),
              state is SignInLoadingState
                  ? CircularProgressIndicator(color: AppColors.primaryColor)
                  : CustomBtn(
                      onPressed: () async {
                        if (authCubit.signInFormKey.currentState!.validate()) {
                          await authCubit.sigInWithEmailAndPassword();
                        }
                      },
                      text: AppStrings.signIn,
                    ),
            ],
          ),
        );
      },
    );
  }
}
