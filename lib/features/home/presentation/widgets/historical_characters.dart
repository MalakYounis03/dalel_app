import 'package:dalel_app/core/functions/custom_toast.dart';
import 'package:dalel_app/core/widgets/custom_shimmer_category.dart';
import 'package:dalel_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:dalel_app/features/home/presentation/cubit/home_state.dart';
import 'package:dalel_app/core/widgets/custom_category_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoricalCharacters extends StatelessWidget {
  const HistoricalCharacters({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetHistoricalCharactersFailure) {
          showToast(state.errMessage);
        } else {
          print(
            "eeeeeeeeeeeeeeeellllllllllllllllllsssssssssssssssssseeeeeeeeeeee",
          );
        }
      },
      builder: (context, state) {
        return state is GetHistoricalCharactersLoading
            ? const CustomShimmerCategory()
            : CustomCategoryListView(
                dataList: context.read<HomeCubit>().historicalCharacters,
                routePath: "/historicalCharactersDetailsView",
              );
      },
    );
  }
}
