import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

bool value = false;

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: AppColors.black,
      value: value,
      onChanged: (newValue) {
        setState(() {
          value = newValue!;
          BlocProvider.of<AuthCubit>(
            context,
          ).updateTermsAndConditionCheckBox(newValue: newValue);
        });
      },
      side: BorderSide(color: AppColors.grey),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    );
  }
}
