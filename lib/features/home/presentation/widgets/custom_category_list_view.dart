import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/home/data/models/historical_periods_model.dart';
import 'package:dalel/features/home/presentation/widgets/custom_category_list_view_item.dart';
import 'package:flutter/material.dart';

class CustomCategoryListView extends StatelessWidget {
  const CustomCategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection(FireBaseStrings.historicalPeriods).get(),
      builder: (context,snapshot) {

          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.docs[0].exists) {
            return const Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            List<HistoricalPeriodsModel> historicalPeriods = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              historicalPeriods
                  .add(HistoricalPeriodsModel.fromJson(snapshot.data!.docs[i]));
            }

               return SizedBox(
          height: 133,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            clipBehavior: Clip.none, // Show shadow good
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const CustomCategoryListViewItem();
            },
            itemCount: 10,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 16,
              );
            },
          ),
        );
          }

          return const Text("loading");

      }
    );
  }
}

