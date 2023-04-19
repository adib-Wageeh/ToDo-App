import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_1/features/List_details/viewmodel/toDo_bloc/todo_cubit.dart';
import '../../../../../core/functions/global_functions.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../List_details/view/date_details.dart';
import '../../../model/date.dart';
import '../../viewModel/dates_bloc/dates_cubit.dart';
import '../../../../global_widgets/edit_bottom_sheet_widget.dart';

class ListItemWidget extends StatelessWidget {

  final Date date;
  const ListItemWidget({required this.date,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
      color: Assets.listItemColor
      ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: (){
              BlocProvider.of<TodoCubit>(context).getToDoTasks(date);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DateDetails(date: date,)));
            },
            child: Row(
            children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(date.getDateString(date.dateTime),style: const TextStyle(fontSize: 24)),
            ),
            const Spacer(),
            Builder(
              builder: (context) {
                return IconButton(onPressed: (){
                  showModalBottomSheet(context: context, builder: (context){
                    return ShowBottomSheet(
                      onEditTabbed: (){
                        GlobalFunctions.bottomDateChanger(context: context,dateObject: date);
                      },onDeleteTabbed: (){
                      BlocProvider.of<DatesCubit>(context).deleteDate(date);
                      Navigator.of(context).pop();
                    },
                    );
                  },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22))
                  );
                }, icon: const Icon(Icons.more_vert_rounded),
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



