import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_shimmer_category.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model.dart';
import 'package:dalel_app/features/home/presentation/widgets/historical_periods_items.dart';
import 'package:flutter/material.dart';

class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance
          .collection(FireBaseStrings.historicalPeriods)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        if (snapshot.hasData && !snapshot.data!.docs[0].exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          List<HistoricalPeriodsModel> historicalPeriods = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            historicalPeriods.add(
              HistoricalPeriodsModel.fromJson(snapshot.data!.docs[i]),
            );
          }
          return SizedBox(
            height: 96,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return HistoricalPeriodsItem(model: historicalPeriods[index]);
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 10);
              },
              itemCount: snapshot.data!.docs.length,
            ),
          );
        }

        return CustomShimmerCategory();
      },
    );
  }
}
