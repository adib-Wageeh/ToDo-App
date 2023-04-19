part of 'todo_cubit.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {}
class TodoLoading extends TodoState {}
class TodoLoaded extends TodoState {
  final Date date;
  TodoLoaded({required this.date});
}
class TodoError extends TodoState {
  final String error;
  TodoError({required this.error});
}
