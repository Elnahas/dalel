import 'package:dalel/core/model/data_model.dart';
import 'package:dalel/features/home/presentation/widgets/custom_data_list_view_item.dart';
import 'package:flutter/material.dart';

class CustomDataListView extends StatelessWidget {
  const CustomDataListView({
    super.key, required this.dataList,
  });

  final List<DataModel> dataList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 96,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          itemBuilder: (context, index) {
            return CustomDataListViewItem(
              model:
                  dataList[index],
            );
          },
          itemCount: dataList.length,
          separatorBuilder: (context, index) => const SizedBox(
            width: 10,
          ),
        ),
      );
  }
}
