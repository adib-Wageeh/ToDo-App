import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:to_do_1/core/utils/database.dart';
import '../../../homepage/model/date.dart';
part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit({required this.db}) : super(TodoInitial());

  final Database db;

  void getToDoTasks(Date date)async{
    emit(TodoLoading());
   final result =await db.getToDos(date);
   result.fold(
           (error) => emit(TodoError(error: error)),
           (data) {
             if(data.tasks.isEmpty){
               emit(TodoInitial());
             }else {
               emit(TodoLoaded(date: date));
             }
           });
  }

  void setAsDone(Date date,int taskIndex)async{
  emit(TodoLoading());
  await db.toggleDoneState(date,taskIndex);
  getToDoTasks(date);

  }


  void addToDo(Date date,String text)async{
    emit(TodoLoading());
    await db.addToDo(date,text);
    getToDoTasks(date);

  }

  void deleteToDo(Date date,Task task)async{
    emit(TodoLoading());
    final response = db.deleteTodo(date,task);
    response.fold((error) =>
        emit(TodoError(error: error))
        , (date) =>
            getToDoTasks(date)
    );
  }

  void editToDo(Date date,int taskIndex,String text)async{

    emit(TodoLoading());
    final result = await db.editTodo(date,taskIndex,text);
    result.fold((error) => emit(TodoError(error: error)), (right) => getToDoTasks(date));

  }

}
