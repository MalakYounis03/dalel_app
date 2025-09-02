import 'package:dalel_app/core/model/data_model.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/features/home/data/models/wars_model.dart';

class HistoricalCharactersModel extends DataModel {
  final List<WarsModel> wars;

  HistoricalCharactersModel({
    required this.wars,
    required super.name,
    required super.image,
    required super.description,
  });

  factory HistoricalCharactersModel.fromJson(jsonData, warsList) {
    return HistoricalCharactersModel(
      name: jsonData[FireBaseStrings.name],
      image: jsonData[FireBaseStrings.image],
      description: jsonData[FireBaseStrings.description],
      wars: warsList,
    );
  }
}
