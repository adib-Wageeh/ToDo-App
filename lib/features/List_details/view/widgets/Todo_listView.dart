import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_1/features/List_details/viewmodel/toDo_bloc/todo_cubit.dart';
import 'package:to_do_1/features/homepage/model/date.dart';
import 'list_todos_item_widget.dart';

class ToDoListView extends StatelessWidget {

  final Date date;
  const ToDoListView({required this.date, Key ? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: ListView.separated(itemBuilder: (context,index){
    return ListTodos(taskIndex: index,date: date,task: date.tasks[index],onTab: (){
      BlocProvider.of<TodoCubit>(context).setAsDone(date,index);
    },);
    }, separatorBuilder: (context,index){
    return const SizedBox(height: 10,);
    },
    itemCount: date.tasks.length,
    ),
    );
    }

}
