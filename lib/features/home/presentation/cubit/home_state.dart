class HomeState {}

final class HomeInitial extends HomeState {}

final class GetHistoricalPeriodsLoading extends HomeState {}

final class GetHistoricalPeriodsSuccess extends HomeState {}

final class GetHistoricalPeriodsFailure extends HomeState {
  final String errMessage;

  GetHistoricalPeriodsFailure({required this.errMessage});
}

final class GetHistoricalCharactersLoading extends HomeState {}

final class GetHistoricalCharactersSuccess extends HomeState {}

final class GetHistoricalCharactersFailure extends HomeState {
  final String errMessage;
  GetHistoricalCharactersFailure({required this.errMessage});
}
