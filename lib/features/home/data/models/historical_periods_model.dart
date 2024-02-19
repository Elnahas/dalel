import 'package:dalel/core/utils/app_strings.dart';

class HistoricalPeriodsModel {
  final String name;
  final String image;
  final String description;
  final Map<String, dynamic> wars;

  HistoricalPeriodsModel(
      {required this.name,
      required this.image,
      required this.description,
      required this.wars});

  factory HistoricalPeriodsModel.fromJson(jsonData) {
    return HistoricalPeriodsModel(
        name: jsonData[FireBaseStrings.name],
        image: jsonData[FireBaseStrings.image],
        description: jsonData[FireBaseStrings.description],
        wars: jsonData[FireBaseStrings.wars]);
  }
}
