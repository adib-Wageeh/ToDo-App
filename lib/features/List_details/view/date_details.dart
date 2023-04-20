import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_1/features/List_details/view/widgets/Todo_listView.dart';
import 'package:to_do_1/features/List_details/view/widgets/no_activity_widget.dart';
import '../../../constants.dart';
import '../../../core/functions/global_functions.dart';
import '../../homepage/model/date.dart';
import '../../global_widgets/floating_button_widget.dart';
import '../viewmodel/toDo_bloc/todo_cubit.dart';

class DateDetails extends StatelessWidget with GlobalFunctions{
  final Date date;
  const DateDetails({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text(date.getDateString(date.dateTime))),
      body: SafeArea(
          child:
          BlocBuilder<TodoCubit, TodoState>(
            builder: (context, state) {
              if (state is TodoLoaded) {
                return ToDoListView(date: state.date,);
              } else if (state is TodoLoading) {
                return const Center(child: CircularProgressIndicator(),);
              } else if (state is TodoError) {
                return Center(child: Text(state.error),);
              }
              return const NoActivityWidget();
            },
          )
      ),

      floatingActionButton: FloatingButtonWidget(
          title: detailsButtonText, onTab: (context) {
        GlobalFunctions.bottomAddTodo(context,date);
      }),

    );
  }
}
