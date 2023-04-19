part of 'dates_cubit.dart';

@immutable
abstract class DatesState {}

class DatesInitial extends DatesState {}
class DatesLoading extends DatesState {}
class DatesLoaded extends DatesState {
  final List<Date> dates;
  DatesLoaded({required this.dates});
}
class DatesError extends DatesState {

  final String error;
  DatesError({required this.error});
}
