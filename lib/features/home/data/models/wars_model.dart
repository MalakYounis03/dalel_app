import 'package:dalel_app/core/model/data_model.dart';

class WarsModel extends DataModel {
  WarsModel({
    required super.name,
    required super.image,
    required super.description,
  });
  factory WarsModel.fromJson(jsonData) {
    return WarsModel(
      name: jsonData['name'],
      image: jsonData['image'],
      description: jsonData['description'],
    );
  }
}
