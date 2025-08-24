import 'package:dalel_app/core/model/data_model.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/features/home/data/models/wars_model.dart';

class HistoricalPeriodsModel extends DataModel {
  final List<WarsModel> wars;

  HistoricalPeriodsModel({
    required this.wars,
    required super.name,
    required super.image,
    required super.description,
  });

  factory HistoricalPeriodsModel.fromJson(jsonData, warsList) {
    return HistoricalPeriodsModel(
      name: jsonData[FireBaseStrings.name],
      image: jsonData[FireBaseStrings.image],
      description: jsonData[FireBaseStrings.description],
      wars: warsList,
    );
  }
}
