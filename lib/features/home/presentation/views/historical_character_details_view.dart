import 'package:dalel_app/features/home/data/models/historical_characters_model.dart';
import 'package:flutter/material.dart';

class HistoricalCharacterDetailsView extends StatelessWidget {
  const HistoricalCharacterDetailsView({super.key, required this.model});
  final HistoricalCharactersModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("HistoricalCharacterDetailsView")),
    );
  }
}
