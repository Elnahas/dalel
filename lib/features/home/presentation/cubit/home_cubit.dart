import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/home/data/models/historical_periods_model.dart';
import 'package:dalel/features/home/data/models/wars_model.dart';
import 'package:dalel/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<HistoricalPeriodsModel> historicalPeriods = [];
  List<WarsModel> warsModelList = [];

  getHistoricalPeriods() async {
    try {
      emit(GetHistoricalPeriodsLoading());
      await FirebaseFirestore.instance
          .collection(FireBaseStrings.historicalPeriods)
          .get()
          .then((value) => value.docs.forEach((element) async {
                await getWarsList(element);
                historicalPeriods.add(HistoricalPeriodsModel.fromJson(
                    element.data(), warsModelList));
                emit(GetHistoricalPeriodsSuccess());
              }));
    } on Exception catch (e) {
      emit(GetHistoricalPeriodsFailure(errMessage: e.toString()));
    }
  }

  Future<void> getWarsList(
      QueryDocumentSnapshot<Map<String, dynamic>> element) async {
    await FirebaseFirestore.instance
        .collection(FireBaseStrings.historicalPeriods)
        .doc(element.id)
        .collection(FireBaseStrings.wars)
        .get()
        .then((value) => value.docs.forEach((element) {
              warsModelList.add(WarsModel.fromjson(element.data()));
            }));
  }
}
