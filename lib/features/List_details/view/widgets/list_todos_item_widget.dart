import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_1/features/List_details/view/widgets/toDoEditText.dart';
import 'package:to_do_1/features/List_details/viewmodel/toDo_bloc/todo_cubit.dart';
import 'package:to_do_1/features/homepage/model/date.dart';
import '../../../../core/utils/assets.dart';
import '../../../global_widgets/edit_bottom_sheet_widget.dart';
import 'package:expandable_text/expandable_text.dart';

class ListTodos extends StatelessWidget {

  final Task task;
  final Date date;
  final int taskIndex;
  final void Function()? onTab;
  const ListTodos({required this.taskIndex,required this.date,required this.onTab,required this.task,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
            color: Assets.listItemColor
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: onTab,
            child: Row(

              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: ExpandableText(
                      task.taskName,
                      expandText: "show more",
                      collapseText: 'show less',
                       maxLines: 100,
                       expanded: false,
                       style:  TextStyle(fontSize: 24,
                     decoration: (task.isDone)?TextDecoration.lineThrough:TextDecoration.none,
                      decorationColor: Colors.red,
                    )
                    ),
                  ),
                ),
               // const Spacer(),
                Builder(
                    builder: (context) {
                      return IconButton(onPressed: (){
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                          context: context,
                          builder: (context)=> ShowBottomSheet(onDeleteTabbed: (){
    BlocProvider.of<TodoCubit>(context).deleteToDo(date,task);
    Navigator.of(context).pop();
                            },onEditTabbed: (){
                            showModalBottomSheet(context: context, builder: (context){
                              return ToDoEditText(date:date,task:task,taskIndex: taskIndex,);
                            }
                                ,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22))
                            );
                          },));}
    , icon: const Icon(Icons.more_vert_rounded),
                        splashRadius: 1,
                      );
                    }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}