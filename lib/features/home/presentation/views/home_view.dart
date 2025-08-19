import 'package:dalel_app/features/home/presentation/widgets/home_sections.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: HomeAppBarSection()),
            SliverToBoxAdapter(child: HistoricalPeriodsSection()),
            SliverToBoxAdapter(child: HistoricalCharacterSection()),
            SliverToBoxAdapter(child: HistoricalSouvenirsSection()),
          ],
        ),
      ),
    );
  }
}
