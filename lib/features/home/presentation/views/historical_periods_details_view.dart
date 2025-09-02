import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_header_text.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model.dart';
import 'package:dalel_app/features/home/presentation/widgets/historical_characters.dart';
import 'package:dalel_app/features/home/presentation/widgets/home_sections.dart';
import 'package:dalel_app/features/home/presentation/widgets/period_details_section.dart';
import 'package:dalel_app/features/home/presentation/widgets/period_wars_section.dart';
import 'package:flutter/material.dart';

class HistoricalPeriodsDetailsView extends StatelessWidget {
  const HistoricalPeriodsDetailsView({super.key, required this.model});
  final HistoricalPeriodsModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: HomeAppBarSection()),
            const SliverToBoxAdapter(child: SizedBox(height: 7)),
            SliverToBoxAdapter(
              child: PeriodDetailsSection(
                periodName: model.name,
                description: model.description,
                imageUrl: model.image,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 22)),
            SliverToBoxAdapter(child: PeriodWarsSection(warsList: model.wars)),
            SliverToBoxAdapter(child: RecommendationsSection()),
          ],
        ),
      ),
    );
  }
}

class RecommendationsSection extends StatelessWidget {
  const RecommendationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(text: AppStrings.recommendations),
        SizedBox(height: 16),
        HistoricalCharacters(),
        SizedBox(height: 32),
      ],
    );
  }
}
