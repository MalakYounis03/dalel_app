import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model.dart';
import 'package:dalel_app/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<HistoricalPeriodsModel> historicalPeriods = [];
  getHistoricalPeridos() async {
    print("*****************************THIS METHOD");

    try {
      emit(GetHistoricalPeriodsLoading());
      await FirebaseFirestore.instance
          .collection(FireBaseStrings.historicalPeriods)
          .get()
          .then(
            (value) => value.docs.forEach((element) {
              historicalPeriods.add(
                HistoricalPeriodsModel.fromJson(element.data()),
              );
            }),
          );
      emit(GetHistoricalPeriodsSuccess());
    } on Exception catch (e) {
      emit(GetHistoricalPeriodsFailure(errMessage: e.toString()));
    }
  }
}
