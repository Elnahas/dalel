import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/widgets/custom_header_text.dart';
import 'package:dalel/features/home/presentation/widgets/home_sections/historical_periods_section.dart';
import 'package:dalel/features/home/presentation/widgets/home_sections/home_app_bar_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 28)),
            SliverToBoxAdapter(child: CustomHomeViewAppBar()),
            SliverToBoxAdapter(child: SizedBox(height: 32)),
            SliverToBoxAdapter(
                child: CustomHeaderText(text: AppStrings.historicalPeriods)),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: HistoricalPeriods(),
            ),
            SliverToBoxAdapter(),
          ],
        ),
      ),
    );
  }
}

