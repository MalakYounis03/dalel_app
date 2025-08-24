import 'package:dalel_app/core/functions/custom_toast.dart';
import 'package:dalel_app/core/widgets/custom_shimmer_category.dart';
import 'package:dalel_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:dalel_app/features/home/presentation/cubit/home_state.dart';
import 'package:dalel_app/features/home/presentation/widgets/historical_periods_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetHistoricalPeriodsFailure) {
          showToast(state.errMessage);
        }
      },
      builder: (context, state) {
        return state is GetHistoricalPeriodsLoading
            ? const CustomShimmerCategory()
            : SizedBox(
                height: 96,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 10);
                  },
                  clipBehavior: Clip.none,
                  itemCount: context.read<HomeCubit>().historicalPeriods.length,
                  itemBuilder: (context, index) {
                    return HistoricalPeriodsItem(
                      model: context.read<HomeCubit>().historicalPeriods[index],
                    );
                  },
                ),
              );
      },
    );
    // builder: (context, state) {
    //   return FutureBuilder<QuerySnapshot>(
    //     future: FirebaseFirestore.instance
    //         .collection(FireBaseStrings.historicalPeriods)
    //         .get(),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasError) {
    //         return Text(snapshot.error.toString());
    //       }

    //       if (snapshot.hasData && !snapshot.data!.docs[0].exists) {
    //         return Text("Document does not exist");
    //       }

    //       if (snapshot.connectionState == ConnectionState.done) {
    //         List<HistoricalPeriodsModel> historicalPeriods = [];
    //         for (int i = 0; i < snapshot.data!.docs.length; i++) {
    //           historicalPeriods.add(
    //             HistoricalPeriodsModel.fromJson(snapshot.data!.docs[i]),
    //           );
    //         }
    //         return SizedBox(
    //           height: 96,
    //           child: ListView.separated(
    //             clipBehavior: Clip.none,

    //             scrollDirection: Axis.horizontal,
    //             itemBuilder: (context, index) {
    //               return HistoricalPeriodsItem(
    //                 model: historicalPeriods[index],
    //               );
    //             },
    //             separatorBuilder: (context, index) {
    //               return SizedBox(width: 10);
    //             },
    //             itemCount: snapshot.data!.docs.length,
    //           ),
    //         );
    //       }

    //       return CustomShimmerCategory();
    //     },
    //   );
  }
}
