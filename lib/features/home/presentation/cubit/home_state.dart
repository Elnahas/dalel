class HomeState {}

final class HomeInitial extends HomeState {}

final class GetHistoricalPeriodsSuccess extends HomeState {}
final class GetHistoricalPeriodsLoading extends HomeState {}
final class GetHistoricalPeriodsFailure extends HomeState {
  final String errMessage;

  GetHistoricalPeriodsFailure({required this.errMessage});
}

