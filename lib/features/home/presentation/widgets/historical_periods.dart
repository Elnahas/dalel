import 'package:dalel/core/functions/custome_toast.dart';
import 'package:dalel/core/widgets/custom_shimmer_category.dart';
import 'package:dalel/features/home/presentation/cubit/home_cubit.dart';
import 'package:dalel/features/home/presentation/cubit/home_state.dart';
import 'package:dalel/features/home/presentation/widgets/historical_period_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if(state is GetHistoricalPeriodsFailure){
          showToast(state.errMessage);
        }
      },
      builder: (context, state) {

                return state is GetHistoricalPeriodsLoading?CustomShimmerCategory(): SizedBox(
                  height: 96,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    clipBehavior: Clip.none,
                    itemBuilder: (context, index) {
                      return HistoricalPeriodItem(
                        historicalPeriodsModel: context.read<HomeCubit>().historicalPeriods[index],
                      );
                    },
                    itemCount: context.read<HomeCubit>().historicalPeriods.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                  ),
                );

      },
    );
  }
}